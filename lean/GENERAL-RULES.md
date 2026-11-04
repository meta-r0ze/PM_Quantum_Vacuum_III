# General persistence rules, independent of the constants example

The `PMConstants.General` target imports general modules and the generic
positive-real `Interface` law. It imports no `PMSubstrate` module and no Paper III
constant definitions. `AuditGeneral.lean` enforces that dependency separation and
checks all transitive proof axioms. The normal `check.sh` runs this audit and the
complete project audit.

## Capacity

`General.Capacity.Feasible` describes nonnegative divisible service completing
every stated task within a fixed interval and respecting each worker's capacity
including interface overhead. The theorems prove:

- Total demand plus overhead cannot exceed total capacity.
- Dividing an unchanged insufficient budget cannot resolve overload.
- Equal-capacity workers have a necessary lower bound on their number.
- A family of different divisions can meet the same constraints, and feasible
  systems can retain idle capacity.

The fixed workload/deadline and exclusion of dropped or deferred work are
premises. Extra parallel workers must supply additional capacity. These results
do not assert that the aggregate bound solves every discrete scheduling problem.

## Reversible encoding

`General.Encoding` proves that a coarse label and retained metadata preserve
states exactly when metadata separates every pair of states merged by the coarse
label. This is equivalent to the existence of a decoder recovering every encoded
state; unused codes may decode to `none`.

For finite alphabets, each coarse fiber fits into the metadata alphabet, and the
whole state space fits into the product of coarse labels and metadata states.
The quotient/remainder case therefore requires at least k metadata states for k
independent remainders. Relabeling metadata preserves reversibility. A physical
mass interpretation or an erasure-heat law is additional application structure.

## Matching

`General.Matching` uses the stated positive-real interface law. Reflected and
transmitted load sum to the incident load. Reflected load is not declared to be
irreversible dissipation. A budget B for handling reflections gives the exact
criterion P·r² ≤ B, equivalently T ≥ 1−B/P when P>0. Zero reserve forces an exact
match; positive reserve can accommodate a mismatch.

This formalizes a conditional resource rule rather than a universal wave law
for cells, firms or arbitrary information interfaces. The numerical tolerance
for the vacuum still requires a derived reserve and physical interface law.
It is not chosen to cover the existing scalar/aperture discrepancy.

## Nesting

`General.Hierarchy` proves a depth bound n ≤ B/c_min when each level consumes at
least c_min>0. It also proves a natural-resource descent bound. Strictly positive
real costs alone do not bound depth: costs 2^(-(i+1)) have every finite prefix
within budget one. Finite branching is an additional premise for concluding
finitely many total nodes from bounded depth.

## Manuscript integration

`paper/2_nested_persistence.tex` now states these contracts and their conditions.
The application introduction in `paper/3_physics_validation.tex` distinguishes
them from the extra substrate-specific workload, encoding, response and selection
premises. The vacuum constants were preserved. Later application sections still
need to be reconciled systematically with these conditions, especially claims
of universal saturation, exact surface matching and uniquely forced allocations.


## Repeated-cycle service and relative encoding

General.Service proves finite-cycle telescoping and bounded-backlog service
balance with phase-dependent demand and service. A common nonzero operation rate
fixes normalized cycle-total service shares. Full utilization, schedulability
before deadlines and a physical workload are not consequences of that result.
The old SteadyAllocation theorem statements are retained as compatibility names
for the shared drift lemmas.

General.RelationalEncoding gives an exact relative representation and decoder:
retain the reference value plus the nonself differences. The reference position
is not the reference value. Differences alone merge constant configurations
unless global shifts are explicitly quotiented out. This proves conservation
of data, not a rate or per-field maintenance cost.
