import PMConstants.ControllerHamiltonian
import PMAction.Reconstruction

/-! A finite mathematical witness separating a one-tick controller from its
canonical full-time lifted generator. Transfer weights and time are deliberately
supplied; no substrate selection, locality or primitive cost is inferred. -/
noncomputable section
namespace PMConstants.ControllerTransferWitness
open Matrix Finset

/-- Strictly positive symmetric stochastic transfer. -/
def transfer : Matrix (Fin 4) (Fin 4) ℝ := (1/32 : ℝ) •
  !![13,7,7,5; 7,13,5,7; 7,5,13,7; 5,7,7,13]

def inverseTransfer : Matrix (Fin 4) (Fin 4) ℝ := (1/4 : ℝ) •
  !![17,-7,-7,1; -7,17,1,-7; -7,1,17,-7; 1,-7,-7,17]

def realBasis : Matrix (Fin 4) (Fin 4) ℝ := (1/2 : ℝ) •
  !![1,1,1,1; 1,-1,1,-1; 1,1,-1,-1; 1,-1,-1,1]

def basis : Matrix (Fin 4) (Fin 4) ℂ := realBasis.map (fun x => (x : ℂ))
def transferC : Matrix (Fin 4) (Fin 4) ℂ := transfer.map (fun x => (x : ℂ))

def eigenTransfer : Fin 4 → ℝ := ![1,1/4,1/4,1/8]
def eigenTwoTick : Fin 4 → ℝ := ![1,1/16,1/16,1/64]
def energy (i : Fin 4) : ℝ := -Real.log (eigenTwoTick i)
def tick : ℝ := Real.pi/(2*Real.log 2)

def controller : Matrix (Fin 4) (Fin 4) ℂ := (1/2 : ℂ) •
  !![1,1,1,-1; 1,1,-1,1; 1,-1,1,1; -1,1,1,1]

def generator : Matrix (Fin 4) (Fin 4) ℂ :=
  basis*PMAction.LinkExpansion.genDiag energy*basisᴴ

lemma transfer_positive : ∀ i j, 0 < transfer i j := by
  intro i j; fin_cases i <;> fin_cases j <;> norm_num [transfer]
lemma transfer_rows : ∀ i, (∑ j, transfer i j)=1 := by
  intro i; fin_cases i <;> norm_num [transfer,Fin.sum_univ_succ]
lemma transfer_symmetric : transfer.IsSymm := by
  ext i j; fin_cases i <;> fin_cases j <;> rfl
lemma inverse_left : inverseTransfer*transfer=1 := by
  ext i j; fin_cases i <;> fin_cases j <;>
    norm_num [transfer,inverseTransfer,Matrix.mul_apply,Fin.sum_univ_succ]

theorem transfer_injective : Function.Injective transfer.mulVec := by
  intro x y h
  have he := congrArg inverseTransfer.mulVec h
  simpa only [Matrix.mulVec_mulVec,inverse_left,one_mulVec] using he

theorem two_tick_positive : (transfer*transfer).PosDef :=
  PMAction.Reconstruction.two_tick_positive transfer transfer_symmetric transfer_injective

lemma detailed_balance : ∀ i j,
    (1/4 : ℝ)*transfer i j=(1/4 : ℝ)*transfer j i := by
  intro i j
  have h := congrFun (congrFun transfer_symmetric.eq i) j
  simpa [Matrix.transpose_apply] using congrArg (fun x : ℝ => (1/4)*x) h.symm

lemma uniform_stationary : ∀ j, (∑ i, (1/4 : ℝ)*transfer i j)=1/4 := by
  intro j; fin_cases j <;> norm_num [transfer,Fin.sum_univ_succ]

lemma symmetrization : PMAction.Reconstruction.sym (fun _ : Fin 4 => (1/4 : ℝ)) transfer=transfer := by
  ext i j
  unfold PMAction.Reconstruction.sym
  have hs : Real.sqrt (1/4 : ℝ) ≠ 0 := (Real.sqrt_pos.mpr (by norm_num)).ne'
  field_simp

lemma basis_left : basisᴴ*basis=1 := by
  ext i j; fin_cases i <;> fin_cases j <;>
    norm_num [basis,realBasis,Matrix.mul_apply,Matrix.conjTranspose_apply,Fin.sum_univ_succ]
lemma basis_right : basis*basisᴴ=1 := by
  ext i j; fin_cases i <;> fin_cases j <;>
    norm_num [basis,realBasis,Matrix.mul_apply,Matrix.conjTranspose_apply,Fin.sum_univ_succ]
lemma real_diagonalization : transfer=realBasis*diagonal eigenTransfer*realBasisᵀ := by
  ext i j; fin_cases i <;> fin_cases j <;>
    norm_num [transfer,realBasis,eigenTransfer,Matrix.mul_apply,Fin.sum_univ_succ]
lemma two_tick_diagonalization :
    transferC*transferC=basis*diagonal (fun i => (eigenTwoTick i : ℂ))*basisᴴ := by
  ext i j; fin_cases i <;> fin_cases j <;>
    norm_num [transferC,transfer,basis,realBasis,eigenTwoTick,Matrix.mul_apply,
      Matrix.conjTranspose_apply,Fin.sum_univ_succ]
lemma controller_diagonalization :
    controller=basis*diagonal (![1,1,1,-1] : Fin 4 → ℂ)*basisᴴ := by
  ext i j; fin_cases i <;> fin_cases j <;>
    norm_num [controller,basis,realBasis,Matrix.mul_apply,Matrix.conjTranspose_apply,Fin.sum_univ_succ]

/-- This really is the existing comparison for a two-label swap, after the
canonical sum-to-Fin reindexing. -/
lemma actual_comparison :
    Matrix.reindex (finSumFinEquiv : Fin 2 ⊕ Fin 2 ≃ Fin 4)
      (finSumFinEquiv : Fin 2 ⊕ Fin 2 ≃ Fin 4)
      (PMConstants.CoherentComparisonRepair.compare ((Equiv.swap (0 : Fin 2) 1).permMatrix ℂ))=controller := by
  ext i j; fin_cases i <;> fin_cases j <;>
    norm_num [Matrix.reindex,PMConstants.CoherentComparisonRepair.compare,
      PMConstants.CoherentComparisonRepair.plus,PMConstants.CoherentComparisonRepair.minus,
      Equiv.Perm.permMatrix,controller]

lemma eigen_positive : ∀ i, 0 < eigenTwoTick i := by
  intro i; fin_cases i <;> norm_num [eigenTwoTick]
lemma eigen_exp (i : Fin 4) : Real.exp (-energy i)=eigenTwoTick i := by
  simp only [energy,neg_neg]
  exact Real.exp_log (eigen_positive i)

lemma generator_hermitian : generator.IsHermitian := by
  change generatorᴴ=generator
  simp [generator,PMAction.LinkExpansion.genDiag,Matrix.conjTranspose_mul,
    Matrix.diagonal_conjTranspose,Matrix.mul_assoc]

lemma energy_values : energy=![0,4*Real.log 2,4*Real.log 2,6*Real.log 2] := by
  have h16 : Real.log (16 : ℝ)=4*Real.log 2 := by
    rw [show (16 : ℝ)=2^4 by norm_num,Real.log_pow]; norm_num
  have h64 : Real.log (64 : ℝ)=6*Real.log 2 := by
    rw [show (64 : ℝ)=2^6 by norm_num,Real.log_pow]; norm_num
  funext i
  fin_cases i <;> norm_num [energy,eigenTwoTick,Real.log_div,Real.log_inv,h16,h64]

lemma tick_positive : 0 < tick := by
  unfold tick
  exact div_pos Real.pi_pos (mul_pos (by norm_num) (Real.log_pos (by norm_num)))

lemma phase_angles : (fun i => -tick*energy i)=![0,-2*Real.pi,-2*Real.pi,-3*Real.pi] := by
  have hl : Real.log 2 ≠ 0 := (Real.log_pos (by norm_num : (1 : ℝ)<2)).ne'
  funext i
  rw [energy_values]
  fin_cases i <;> dsimp [tick] <;> field_simp [hl] <;> ring

lemma exp_neg_nat_pi (k : ℕ) :
    Complex.exp (((-(k : ℝ)*Real.pi : ℝ) : ℂ)*Complex.I)=(-1 : ℂ)^k := by
  have he : (((-(k : ℝ)*Real.pi : ℝ) : ℂ)*Complex.I)=
      (k : ℂ)*(-((Real.pi : ℂ)*Complex.I)) := by push_cast; ring
  rw [he,Complex.exp_nat_mul,Complex.exp_neg,Complex.exp_pi_mul_I]
  norm_num

lemma phase_at_tick : PMAction.LinkExpansion.phaseDiag energy (-tick)=
    diagonal (![1,1,1,-1] : Fin 4 → ℂ) := by
  unfold PMAction.LinkExpansion.phaseDiag
  congr 1
  funext i
  rw [congrFun phase_angles i]
  fin_cases i
  · norm_num
  · simpa using exp_neg_nat_pi 2
  · simpa using exp_neg_nat_pi 2
  · simpa using exp_neg_nat_pi 3

/-- A single reconstructed phase generator reaches the comparison at one
supplied positive tick. The full-time trajectory is not the canonical lift K(H). -/
theorem one_tick_controller :
    NormedSpace.exp (((-tick : ℝ) : ℂ)*Complex.I • generator)=controller := by
  rw [generator,PMConstants.LinkEvolution.diagonalization_exponential basis energy
    basis_left basis_right (-tick),phase_at_tick,← controller_diagonalization]

lemma diagonal_euclidean :
    NormedSpace.exp (-PMAction.LinkExpansion.genDiag energy)=
      diagonal (fun i => (eigenTwoTick i : ℂ)) := by
  rw [PMAction.LinkExpansion.genDiag,Matrix.diagonal_neg,Matrix.exp_diagonal]
  congr 1
  funext i
  rw [Pi.coe_exp]
  change NormedSpace.exp (-(energy i : ℂ))=(eigenTwoTick i : ℂ)
  rw [show -(energy i : ℂ)=((-energy i : ℝ) : ℂ) by simp,
    ← Complex.exp_eq_exp_ℂ,← Complex.ofReal_exp,eigen_exp]

/-- Its Euclidean transfer is exactly the square of the positive stochastic
matrix above. This witnesses the supplied-transfer reconstruction mathematics;
no premise selects these weights or this clock from microscopic PM dynamics. -/
theorem euclidean_reconstruction : NormedSpace.exp (-generator)=transferC*transferC := by
  let U : unitary (Matrix (Fin 4) (Fin 4) ℂ) := ⟨basis,basis_left,basis_right⟩
  have hu : ((Unitary.toUnits U : (Matrix (Fin 4) (Fin 4) ℂ)ˣ) : Matrix (Fin 4) (Fin 4) ℂ)=basis := rfl
  have hi : (((Unitary.toUnits U)⁻¹ : (Matrix (Fin 4) (Fin 4) ℂ)ˣ) : Matrix (Fin 4) (Fin 4) ℂ)=basisᴴ := rfl
  have hn : -generator=basis*(-PMAction.LinkExpansion.genDiag energy)*basisᴴ := by
    simp [generator]
  rw [hn]
  have he := Matrix.exp_units_conj (Unitary.toUnits U) (-PMAction.LinkExpansion.genDiag energy)
  rw [hu,hi,diagonal_euclidean] at he
  rw [he]
  exact two_tick_diagonalization.symm

end PMConstants.ControllerTransferWitness
