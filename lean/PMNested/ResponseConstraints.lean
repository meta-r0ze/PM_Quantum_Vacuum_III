import PMNested.ElectroweakBounds

/-!
# Consistency before completing the overhead microphysics

The original gauge response is tested for EVERY efficiency eta in [0,1],
keeping its displayed electromagnetic input, VEV formula and scale fixed.
This is not a running-coupling calculation or a refutation of other responses.
Scalar field reparametrization is separated from a genuine response correction.
-/
noncomputable section
namespace PMNested.ResponseConstraints
open Electroweak CertifiedConstants ElectroweakBounds JointConstants

def mixing (η : ℝ) : ℝ := 43/(177+16*η)
def weak (η a : ℝ) : ℝ := 4*Real.pi*a/mixing η
def hypercharge (η a : ℝ) : ℝ := 4*Real.pi*a/(1-mixing η)
def neutralMassSquared (η a v : ℝ) : ℝ := (weak η a+hypercharge η a)*v^2/4

theorem baseline : mixing overhead = clockRatio ∧
    weak overhead α = weakSquared α ∧ hypercharge overhead α = hyperchargeSquared α := by
  have hs : mixing overhead = clockRatio := by
    norm_num [mixing, clockRatio, footprint, overhead]
  exact ⟨hs, by simp [weak, weakSquared, hs], by simp [hypercharge, hyperchargeSquared, hs]⟩

theorem mixing_range {η : ℝ} (hη : 0 ≤ η ∧ η ≤ 1) :
    43/193 ≤ mixing η ∧ mixing η ≤ 43/177 := by
  have hd : 0 < 177+16*η := by linarith [hη.1]
  unfold mixing
  constructor
  · apply (le_div_iff₀ hd).mpr
    linarith [hη.2]
  · apply (div_le_iff₀ hd).mpr
    linarith [hη.1]

theorem charge_factor_bound : 0 < 4*Real.pi*α ∧ 4*Real.pi*α < 0.0918 := by
  have hp := product_bounds (by norm_num) (by norm_num) pi_bounds alpha_bounds
  constructor
  · nlinarith [hp.1]
  · nlinarith [hp.2]

/-- A coarse uniform bound suffices to exclude the existing calculator Z input. -/
theorem gauge_sum_bound {η : ℝ} (hη : 0 ≤ η ∧ η ≤ 1) :
    0 < weak η α+hypercharge η α ∧ weak η α+hypercharge η α < 0.534 := by
  have hs := mixing_range hη
  have hsp : 0 < mixing η := by linarith [hs.1]
  have hhp : 0 < 1-mixing η := by linarith [hs.2]
  have ha := charge_factor_bound
  have hw : weak η α < (0.0918 : ℝ)*(193/43) := by
    unfold weak
    apply (div_lt_iff₀ hsp).mpr
    nlinarith [hs.1, ha.2]
  have hh : hypercharge η α < (0.0918 : ℝ)*(177/134) := by
    unfold hypercharge
    apply (div_lt_iff₀ hhp).mpr
    nlinarith [hs.2, ha.2]
  constructor
  · exact add_pos (div_pos ha.1 hsp) (div_pos ha.1 hhp)
  · linarith

/-- The fixed original response cannot reach 90 GeV at ANY allowed efficiency. -/
theorem uniform_z_squared_bound {η : ℝ} (hη : 0 ≤ η ∧ η ≤ 1) :
    neutralMassSquared η α (vev α electronGeV) < (90 : ℝ)^2 := by
  have hg := gauge_sum_bound hη
  have hv := vev_squared_bounds
  have hpos : 0 < (vev α electronGeV)^2 := by nlinarith [hv.1]
  have hupper : (vev α electronGeV)^2 < (246.22 : ℝ)^2 := by nlinarith [hv.2]
  have hp := (mul_lt_mul_of_pos_right hg.2 hpos).trans
    (mul_lt_mul_of_pos_left hupper (by norm_num : (0 : ℝ) < 0.534))
  unfold neutralMassSquared
  nlinarith

theorem uniform_z_mass_bound {η : ℝ} (hη : 0 ≤ η ∧ η ≤ 1) :
    Real.sqrt (neutralMassSquared η α (vev α electronGeV)) < 90 := by
  have hn : 0 ≤ neutralMassSquared η α (vev α electronGeV) := by
    unfold neutralMassSquared
    exact div_nonneg (mul_nonneg (gauge_sum_bound hη).1.le (sq_nonneg _)) (by norm_num)
  have hs := Real.sq_sqrt hn
  have hp := Real.sqrt_nonneg (neutralMassSquared η α (vev α electronGeV))
  have hb := uniform_z_squared_bound hη
  nlinarith

/-- 91.1876 GeV is the pre-existing calculator input, not a newly sourced value. -/
def calculatorZInput : ℝ := 91.1876

theorem no_efficiency_repairs_z {η : ℝ} (hη : 0 ≤ η ∧ η ≤ 1) :
    Real.sqrt (neutralMassSquared η α (vev α electronGeV)) ≠ calculatorZInput := by
  have h := uniform_z_mass_bound hη
  unfold calculatorZInput
  linarith

/-- A scalar-field coordinate change rescales the Yukawa and VEV inversely.
Its mass product is invariant; this is not a physical correction coefficient. -/
theorem scalar_reparametrization (y v c : ℝ) (hc : c ≠ 0) : (y/c)*(c*v) = y*v := by
  field_simp

theorem no_scalar_reparametrization_repairs_electron (c : ℝ) (hc : c ≠ 0)
    {me : ℝ} (hme : me ≠ 0) :
    (electronYukawa α/c)*(c*vev α me)/Real.sqrt 2 ≠ me := by
  rw [scalar_reparametrization _ _ c hc]
  exact no_exact_electron_closure hme

end PMNested.ResponseConstraints
