import PMNested.AvailabilityAudit
import PMFramework.LawSelection

/-!
# The availability mass is the selected law

`AvailabilityAudit.uniform_of_dir_invariant` gets the uniform mass `1/172` on the address grid
(4 directions × 43 phases) only by adding a transitive direction symmetry, and
`d4_relabel_fixes_center` shows the actual `D₄` relabelings are not transitive. A conditional selection model avoids that symmetry premise: the uniform law
uniquely minimizes the specified average/worst return costs. Applying that
selection to a physical reference process still requires its admissible candidate
family and action-rate model. This module computes consequences of the uniform
law; `SelectedColourLoad` supplies the arbitrary-minimizer implication.

* `selected_mass`: the selected law gives each cell `1/172`, is normalized, and is tick
  invariant.
* `selected_excluded`: excluding one cell leaves mass `171/172`. An operational suppression event is separate.
-/

noncomputable section
namespace PMNested.SelectedAvailability
open Finset PMNested.AvailabilityAudit PMNested.General.ReferenceCapacity

theorem selected_mass (x : Grid) :
    (PMFramework.LawSelection.uniform : Mass) x = 1 / 172 := by
  simp [PMFramework.LawSelection.uniform]

theorem selected_normalized : Normalized (PMFramework.LawSelection.uniform : Mass) :=
  ⟨fun x => (PMFramework.LawSelection.uniform_law.1 x).le, PMFramework.LawSelection.uniform_law.2⟩

theorem selected_tick_invariant : TickInvariant (PMFramework.LawSelection.uniform : Mass) :=
  fun _ => rfl

/-- **The overhead `η = 171/172` under the selected law.** -/
theorem selected_excluded (c : Grid) :
    excluded (PMFramework.LawSelection.uniform : Mass) c = 171 / 172 := by
  rw [excluded_eq _ selected_normalized, selected_mass]; norm_num

end PMNested.SelectedAvailability
