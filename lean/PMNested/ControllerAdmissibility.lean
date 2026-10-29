import PMNested.CoherentComparisonRepair
import PMAction.Reconstruction
import PMArch.ChannelSymmetry
import PMArch.Research.OperationalDuality

/-!
# Controller admissibility: integrated supporting facts

Integrated from Claude's supplied audit. Operator restrictions concern the stated
basis, transfer form and label actions; no theorem here excludes every possible
reconstructed Hamiltonian or selects a physical branch assignment.

1. `compare_factor`: `C(U) = M (I ⊕ U) M`, where `M` is the balanced real branch mixer whose
   2×2 pattern is Paper I's `OperationalDuality.sectorMix r` (`mixer_entries`). The controlled
   factor `I ⊕ U` is a permutation whenever `U` is (`controlled_perm`), so the only
   non-permutation ingredient is `M` (`mixer_not_permutation`).
2. `channel_actions_permute`: every generator of Paper I's channel symmetries acts on the 32
   channel labels by a bijection, so on label amplitudes it is a permutation matrix; none of them
   is the mixer.
3. `refl_is_coordinate_swap`: Paper I's sector Weyl reflection in `e₀ − e₁` is the coordinate
   swap used by Paper II's `CarrierEvents.reflect`; `refl_moves_spinor`: it also moves spinor
   carriers, so it is not a reflection controlled by the glue-class label.
4. `transports_exchange_classes`, `hada_transport_moves_root`, `wHada_transport_fixes_root`:
   two class-exchanging lattice automorphisms disagree on whether one root reflection acts
   compatibly on both classes, so the transport behind Paper III's packet matters.
5. `sym_nonneg`, `controller_form_nonneg_diagonal`: a symmetrized survival-weight transfer has
   nonnegative entries, and a nonnegative matrix of controller block form has a diagonal carrier
   block. So a carrier-moving lift cannot be the Euclidean transfer of one survival-weight system.
6. `mixer_transfer_witness`: a nonnegative symmetric, injective two-branch transfer whose matrix
   commutes with the mixer exists: the finite transfer/commutation facts do not select a mixer, its time, or
   a physical composition rule. Those remain separate obligations.
-/

noncomputable section
namespace PMNested.ControllerAdmissibility
open Matrix PMNested.CoherentComparisonRepair

variable {n : Type*} [Fintype n] [DecidableEq n]

/-- The balanced real branch mixer `r [[1, 1], [1, −1]] ⊗ I`. -/
def mixer (r : ℂ) : Matrix (n ⊕ n) (n ⊕ n) ℂ :=
  fromBlocks (r • 1) (r • 1) (r • 1) (-(r • 1))

/-- Apply `U` only on the second branch. -/
def controlled (U : Matrix n n ℂ) : Matrix (n ⊕ n) (n ⊕ n) ℂ := fromBlocks 1 0 0 U

omit [Fintype n] in
/-- The mixer's branch pattern is Paper I's `sectorMix`. -/
theorem mixer_blocks (r : ℝ) :
    mixer (n := n) (r : ℂ) =
      fromBlocks (((PMArch.OperationalDuality.sectorMix r 0 0 : ℝ) : ℂ) • 1)
        (((PMArch.OperationalDuality.sectorMix r 0 1 : ℝ) : ℂ) • 1)
        (((PMArch.OperationalDuality.sectorMix r 1 0 : ℝ) : ℂ) • 1)
        (((PMArch.OperationalDuality.sectorMix r 1 1 : ℝ) : ℂ) • 1) := by
  simp [mixer, PMArch.OperationalDuality.sectorMix, neg_smul]

/-- **The comparison controller is a Hadamard test.** -/
theorem compare_factor (U : Matrix n n ℂ) {r : ℂ} (hr : r * r = 1 / 2) :
    PMNested.CoherentComparisonRepair.compare U = mixer r * controlled U * mixer r := by
  show fromBlocks (plus U) (minus U) (minus U) (plus U) = _
  simp only [mixer, controlled, fromBlocks_multiply, mul_one, mul_zero, add_zero, zero_add]
  rw [fromBlocks_inj]
  simp only [plus, minus, smul_mul_assoc, mul_smul_comm, neg_mul, mul_neg,
    mul_one, one_mul, smul_smul, hr, neg_neg, smul_neg]
  refine ⟨?_, ?_, ?_, ?_⟩ <;> module

omit [Fintype n] in
/-- The controlled factor of a permutation is a permutation. -/
theorem controlled_perm (e : Equiv.Perm n) :
    controlled (e.permMatrix ℂ) = Equiv.Perm.permMatrix ℂ (Equiv.sumCongr (Equiv.refl n) e) := by
  ext (i | i) (j | j) <;>
    simp [controlled, Equiv.Perm.permMatrix, PEquiv.toMatrix_apply, Matrix.one_apply,
      eq_comm]

omit [Fintype n] in
/-- The mixer is not a permutation matrix (it has an entry `r` with `r² = 1/2`). -/
theorem mixer_not_permutation {r : ℂ} (hr : r * r = 1 / 2) (a : n)
    (p : Equiv.Perm (n ⊕ n)) : mixer r ≠ p.permMatrix ℂ := by
  intro h
  have he := congrArg (fun X : Matrix (n ⊕ n) (n ⊕ n) ℂ => X (.inl a) (.inl a)) h
  simp only [mixer, fromBlocks_apply₁₁, Equiv.Perm.permMatrix, PEquiv.toMatrix_toPEquiv_apply,
    Pi.single_apply] at he
  have hr1 : (r • (1 : Matrix n n ℂ)) a a = r := by simp
  rw [hr1] at he
  split_ifs at he with hp
  · rw [he] at hr; norm_num at hr
  · rw [he] at hr; norm_num at hr

/-! ## Paper I's channel symmetries are permutations of labels -/

theorem channel_actions_permute (i : Fin 10) :
    Function.Bijective (PMArch.ChannelSymmetry.genTable i) := by
  rw [Fintype.bijective_iff_injective_and_card]
  exact ⟨by fin_cases i <;> decide, rfl⟩

/-- Paper I's Weyl reflection in `e₀ − e₁` is the coordinate swap of Paper II's carrier event. -/
theorem refl_is_coordinate_swap (y : Fin 4 → ℤ) :
    PMArch.ChannelSymmetry.refl (PMArch.ChannelSymmetry.simple 0) y =
      y ∘ Equiv.swap (0 : Fin 4) 1 := by
  funext i
  fin_cases i <;>
    simp [PMArch.ChannelSymmetry.refl, PMArch.ChannelSymmetry.simple,
      PMArch.ChannelSymmetry.dot4, Fin.sum_univ_four, Equiv.swap_apply_def]

/-- The same reflection moves a spinor-class carrier: it is not controlled by the class label. -/
theorem refl_moves_spinor :
    (![1, -1, 1, -1] : Fin 4 → ℤ) ∈ PMArch.ChannelSymmetry.carriers 2 ∧
      PMArch.ChannelSymmetry.refl (PMArch.ChannelSymmetry.simple 0) ![1, -1, 1, -1] ≠
        ![1, -1, 1, -1] := by
  decide +kernel

/-! ## The triality transport is not fixed by the existing theory

Paper III's packet is two copies of the vector class. If its halves are two glue classes of one
`D₄` sector carried to the vector class by triality, whether the paired reflection is one `E₈`
root reflection depends on that transport. With `hada` it is not; with `wHada = w ∘ hada`
(`w ∈ W(D₄)`) it is. Both are lattice automorphisms exchanging the two classes. -/

open PMArch.ChannelSymmetry in
/-- A Weyl element (coordinate permutation `(0 2)(1 3)` and two sign changes). -/
def weyl (y : Fin 4 → ℤ) : Fin 4 → ℤ := ![y 2, -y 3, -y 0, y 1]

open PMArch.ChannelSymmetry in
def wHada (y : Fin 4 → ℤ) : Fin 4 → ℤ := weyl (hada y)

open PMArch.ChannelSymmetry in
theorem transports_exchange_classes :
    (carriers 1).image hada = carriers 2 ∧ (carriers 2).image hada = carriers 1 ∧
      (carriers 1).image wHada = carriers 2 ∧ (carriers 2).image wHada = carriers 1 ∧
      roots.image weyl = roots := by
  decide +kernel

open PMArch.ChannelSymmetry in
/-- With the Hadamard transport the transported reflection is a different root reflection. -/
theorem hada_transport_moves_root :
    ∃ y ∈ carriers 1, hada (refl (simple 0) y) ≠ refl (simple 0) (hada y) := by
  decide +kernel

open PMArch.ChannelSymmetry in
/-- With `wHada` the same root reflection acts on both classes compatibly. -/
theorem wHada_transport_fixes_root :
    ∀ y ∈ carriers 1 ∪ carriers 2, wHada (refl (simple 0) y) = refl (simple 0) (wHada y) := by
  decide +kernel

/-! ## Survival-weight transfers are nonnegative -/

theorem sym_nonneg {X : Type*} [Fintype X] (π : X → ℝ)
    (T : Matrix X X ℝ) (hT : ∀ x y, 0 ≤ T x y) (x y : X) :
    0 ≤ PMAction.Reconstruction.sym π T x y := by
  unfold PMAction.Reconstruction.sym
  exact div_nonneg (mul_nonneg (Real.sqrt_nonneg _) (hT x y)) (Real.sqrt_nonneg _)

/-- Real controller block form `[[ (1+E)/2, (1−E)/2 ], [ (1−E)/2, (1+E)/2 ]]`. -/
def controllerForm (E : Matrix n n ℝ) : Matrix (n ⊕ n) (n ⊕ n) ℝ :=
  fromBlocks ((1 / 2 : ℝ) • (1 + E)) ((1 / 2 : ℝ) • (1 - E)) ((1 / 2 : ℝ) • (1 - E))
    ((1 / 2 : ℝ) • (1 + E))

omit [Fintype n] in
/-- **A nonnegative matrix of controller form does not move carriers.** -/
theorem controller_form_nonneg_diagonal (E : Matrix n n ℝ)
    (h : ∀ x y, 0 ≤ controllerForm E x y) {a b : n} (hab : a ≠ b) : E a b = 0 := by
  have h1 := h (.inl a) (.inl b)
  have h2 := h (.inl a) (.inr b)
  simp [controllerForm, hab] at h1 h2
  linarith

/-- Hence no survival-weight transfer (nonnegative weights, positive stationary law) has a
symmetrization of controller form with a carrier-moving block. -/
theorem no_survival_controller {π : n ⊕ n → ℝ}
    {T : Matrix (n ⊕ n) (n ⊕ n) ℝ} (hT : ∀ x y, 0 ≤ T x y) (E : Matrix n n ℝ)
    (hS : PMAction.Reconstruction.sym π T = controllerForm E) {a b : n} (hab : a ≠ b) (hE : E a b ≠ 0) :
    False :=
  hE (controller_form_nonneg_diagonal E (fun x y => hS ▸ sym_nonneg π T hT x y) hab)

/-! ## Reconstruction admits a mixer, given a suitable supplied transfer -/

def mixer2 : Matrix (Fin 2) (Fin 2) ℝ := !![1, 1; 1, -1]
def witnessTransfer : Matrix (Fin 2) (Fin 2) ℝ := !![3, 1; 1, 1]

/-- A nonnegative, symmetric, injective two-branch transfer that commutes with the (unnormalized)
mixer, so the mixer is a spectral function of it. Nothing in the existing premises selects these
weights or the evolution time at which the phase evolution equals the mixer. -/
theorem mixer_transfer_witness :
    (∀ i j, 0 ≤ witnessTransfer i j) ∧ witnessTransfer.IsSymm ∧
      witnessTransfer.det ≠ 0 ∧ witnessTransfer * mixer2 = mixer2 * witnessTransfer := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro i j; fin_cases i <;> fin_cases j <;> norm_num [witnessTransfer]
  · ext i j; fin_cases i <;> fin_cases j <;> rfl
  · norm_num [witnessTransfer, Matrix.det_fin_two]
  · ext i j; fin_cases i <;> fin_cases j <;>
      norm_num [witnessTransfer, mixer2, Matrix.mul_apply, Fin.sum_univ_two]

end PMNested.ControllerAdmissibility
