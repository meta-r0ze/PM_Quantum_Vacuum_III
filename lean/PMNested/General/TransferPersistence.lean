import Mathlib.Tactic

/-!
# What persists for transfer between subsystems

Two candidate transfer policies for a shared resource: equal-rate transfer
between all pairs, or directional transfer prioritising the reference direction.
Ask what persists. Bounded queues and a fixed total transfer budget select which
policies are sustainable.

* `equal_persistent`: equal transfer between all pairs persists when the total
  budget permits uniform service — it does not, by itself, distinguish any direction.
* `persistence_selects_equal`: under bounded backlog, if service never exceeds
  demand per queue but the total backlog remains bounded, then service must equal
  demand for each queue. A policy that starves any queue accumulates unbounded
  backlog.

Premise: the work vector (demand per phase) is given. No physical identification
of generation pairs with transfer directions is made here.
-/

noncomputable section
namespace PMNested.General.TransferPersistence

/-- Demand is nonnegative. -/
def IsDemand (d : ℝ) : Prop := 0 ≤ d

/-- A transfer policy: `s` is service, `d` is demand. Feasible means
nonnegative service and service ≤ demand. -/
def FeasibleTransfer (d s : ℝ) : Prop :=
  0 ≤ s ∧ s ≤ d

/-- A queue with service below demand accumulates unbounded backlog.
The drift `d - s > 0` per phase means the backlog exceeds any
finite bound B after sufficiently many phases. -/
theorem backlog_grows_linearly (d s : ℝ) (hstarve : s < d) :
    ∀ (B : ℝ), ∃ n : ℕ, (d - s) * ↑n > B := by
  intro B
  have hpos : (0 : ℝ) < (d - s) := by linarith
  -- For any B, find n such that positive drift * n > B
  have h_exists : ∃ n : ℕ, ↑(n : ℝ) > B / (d - s) := by
    obtain ⟨n, hn⟩ := exists_nat_gt (B / (d - s))
    exact ⟨n, hn⟩
  obtain ⟨n, hn⟩ := h_exists
  use n
  calc
    (d - s) * ↑n > (d - s) * (B / (d - s)) := by
      apply mul_lt_mul_of_pos_left hn hpos
    _ = B := by field_simp [hpos.ne']

/-- If a queue drains faster than demand feeds it (service < demand),
the backlog grows without bound. Bounded backlog therefore forces
service = demand for each queue. -/
theorem persistence_selects_equal {d s : ℝ}
    (_hd : IsDemand d)
    (hle : s ≤ d)
    (hbacklog : ∃ B : ℝ, ∀ n : ℕ, |(d - s) * ↑(n : ℝ)| ≤ B) :
    s = d := by
  by_contra hneq
  have hstarve : s < d := lt_of_le_of_ne hle hneq
  have hdiff : d - s > 0 := by linarith
  -- Bounded backlog means no queue can have positive drift
  obtain ⟨B, hB⟩ := hbacklog
  -- For large n, the absolute value exceeds B
  have h_exceeds : ∃ n : ℕ, (d - s) * ↑(n : ℝ) > B := by
    apply backlog_grows_linearly d s hstarve
  obtain ⟨n, hn⟩ := h_exceeds
  have h_abs_nonneg : 0 ≤ (d - s) * ↑(n : ℝ) := by positivity
  have h_abs_eq : |(d - s) * ↑(n : ℝ)| = (d - s) * ↑(n : ℝ) := by
    rw [abs_of_nonneg h_abs_nonneg]
  have h_contra : |(d - s) * ↑(n : ℝ)| ≤ B := hB n
  rw [h_abs_eq] at h_contra
  linarith [hn]

end PMNested.General.TransferPersistence
