# PM-3-Nested: constants and selection constraints in Lean

Lean 4.34.1. The package depends on the sibling `PM-1-Arch/lean` package and its
pinned mathlib cache, the sibling `PM-2-Action/lean` package for carrier events
and readout, and `PM/lean` for the framework selection theorems. Keep these paper
folders as siblings, then run:

```sh
source ~/.elan/env
./check.sh
```

At Kate's request, the active development order is Paper I → Paper III's
constants and selection constraints, with Paper II supplying the carrier/event bridge.
The dependency direction is Paper I → Paper II → Paper III.

Start with [VERIFICATION-STATUS.md](VERIFICATION-STATUS.md) for verified scope and the table of which
module holds the current statement of each result,
[NEXT-WORK.md](NEXT-WORK.md) for the revised completion order.

`CurrentConstants.current_snapshot` is the public entry point for the current
manuscript values. `LinkSpectralResponse.mass_form_controlled` constructs the
spectral transport and a positive validity radius for the actual W/Z link;
callers no longer supply eigenvectors or a diagonalization premise.

Shared gauge actions (`LinkEvolution`, `PacketGaugeActions`) now prove matrix-exponential
identity, eigenbasis independence and the link group law. `PacketGaugeActions`
implements commuting weak, colour and hypercharge actions on the actual packet;
normalization and physical group selection remain explicit.

Quadratic response and normalization (`PacketTraceForm`) derives
the actual packet trace indices and a controlled mean-readout expansion. It
exposes the next operational distinction: raw refresh weights and effective
index-weighted stiffness ledgers give different mixing unless their conversion
is supplied. The public constants remain candidate formulas under that matching.

Persistence and work selection (`GaugePersistenceChoice`) now derives
an exact sustainable-rate bound from conserved bounded queues and tests the
normalization alternatives. Both persist; a precise raw-floor throughput test
favours the raw ratio. The physical demand contract remains the missing input.

[Carrier protocols and weighted readout](CARRIER-READOUT.md) now classify the
six components of the actual weak/colour gate set and derive response indices
for every invariant incoherent basis preparation. The precise preparation
constraints for the proposed ratio are checked; their physical selection is
still open. The finite-protocol classification can be reused by Paper V.

The preparation follow-through now tests actual inter-sector transfers and a
real E8 root reflection. Simple stationary populations do not give the proposed
matching; root-invariant readout retains the 5/3 index ratio under equal
weak/colour response. Type-dependent integer repair lengths have an exact
flag-cost map, but their physical task is still required. The existing root
inverse has a proved unit repair minimum; see the same carrier/readout guide.

[CONSTANTS-STATUS.md](CONSTANTS-STATUS.md) now lists each current constant,
what Lean verifies, and the missing physical proof. `CoherentComparisonRepair`
constructs a correct controller and coherent flag uncomputation for the existing
readout, including its valid input subspaces. Its primitive implementation and
cost remain open; a controller application is not counted as one E8 event.

`ControllerHamiltonian` now gives an exact projector-coupled generator for
that comparison, with trace and prepared-state cost identities. Its universal
normalization factor does not fix the relative gauge gap. The focused
[Claude admissibility audit](research/controller-admissibility/AUDIT.md) asks whether
the existing state-sum premises supply the generator, preparation and flag
resources; it is separate from the checked operator algebra.

The earlier colour work remains useful evidence about operational assumptions:
geometric load (`ColourGeometricLoad`),
phase response (`ColourPhaseMaintenance`), and
cadence (`ColourRefreshCadence`). A new reference walk is deferred until the
common gauge/event contract specifies what it must implement.

## Checked scope

| Module | Mathematical content |
| --- | --- |
| `Partition` | Exact overhead 171/172, footprint 8295/43, clock fraction 1849/8295, scalar self-coupling 128/989 and Toll 256/989; sign of the stipulated beta expression; residual budget; nonunique solvent allocations; inherited Paper I Toll. |
| `Allocation` | The stated reference, saturation, temporal and regulation equations uniquely select those allocation formulas; witnesses exist. A finite address space need not reserve a slot. Full label symmetry alone cannot select a reserved singleton. |
| `Hypercharge` | Standard rational charges follow from the stated representation, unit scalar charge, invariant Yukawa couplings, weak flux conservation and neutral sterile channel. Without neutrality a family satisfies the same linear and cubic cancellation tests. With fixed doublet charges and neutral sterile channel, cubic cancellation selects the right-quark split up to interchange. |
| `Electroweak` | Proposed VEV, electron Yukawa, Higgs mass, Fermi constant and dressed gauge couplings; positivity, exact mixing and normalization identities, Higgs mass squared, mass-unit covariance. The displayed interface match has no VEV dependence and cannot select a mass scale. Electron-mass closure is an additional dimensionless constraint. |
| `CertifiedConstants` | Exact enclosures for alpha, weak/scalar values and the **legacy** strong/Yukawa formulas. Use `CurrentConstants` for the current manuscript. `constants_selected` exposes allocation and charge hypotheses. |
| `Matching` | The regulator impedance is strictly decreasing for positive scalar coupling, so an exact match has at most one positive solution. Taylor bounds certify a strictly positive mismatch for the prescribed baseline. Canonically normalized Higgs curvature is 2 λ v². |
| `Depth` | Positivity of the stipulated gravity formula; alpha^r differs from (1−alpha)^r; Planck normalization, unity scale and correct impedance ordering. |
| `Bulk` | Multiplicative per-step survival gives p^n once p is supplied. An odd 43-cycle has no integer half-period, and shortest vertex distances are at most 21. A positive half-step is fixed by its square. Thermal-floor and Planck-density ratios retain the electron/Planck hierarchy factor. |
| `Interface` | Reversible quotient/remainder encoding and loss on forgetting the remainder; reflection/transmission identities for the chosen interface law. |
| `ReviewChecks` | Tensor trace multiplies 8 and 3 to 24; an idempotent real projection has only eigenvalues zero and one. |

## Certified model values

All interval endpoints below are exact rational numbers in Lean.

| Quantity | Proved open interval |
| --- | --- |
| Geometric admittance alpha | (0.007297352562, 0.007297352563) |
| Current colour-ledger strong coupling | (0.11799520370, 0.11799520373) |
| Weak fraction | (0.2229053646, 0.2229053647) |
| Scalar self-coupling | (0.1294236602, 0.1294236603) |
| Current VEV-defined electron Yukawa | (0.00000293502845, 0.00000293502847) |

These are enclosures of the model formulas, not experimental measurements or
proofs that those formulas are uniquely selected by the basic PM principles.
Physical coupling identifications, scale and normalization remain explicit
obligations. A mass input supplies the overall unit; lattice dimensionless data
do not supply an independent GeV scale.

## Historical review findings (some subsequently resolved)

- `6_geometric_depth.tex`: per-hop survival 1−alpha does not give alpha^r.
  The two laws differ. The origin and interpolation for depth 21.5 need an
  explicit process; it is not an integer full-hop distance on a 43-cycle.
- The abbreviated inverse thermal-floor expression omits the factor
  M_P/m_e=1/√g. Exactly, M_P/M_min=(M_P/m_e)·16·43³/(pi·alpha).
  Consequently rho/M_P⁴=(alpha/2)·[pi·alpha/(16·43³)]⁴·g².
- The proposed tensor-product trace is 24. The displayed sum giving 11 instead
  describes direct-sum accounting; a rigidity operator still needs defining.
- Z_G(m)=M_P/m is greater than one below M_P, not less.
- A golden-square eigenvalue cannot belong to an idempotent projection. Specify
  the actual E8/H4 map, its domain and its observable.
- The exact interface relation exp(−2λ)/λ=6η is incompatible with the prescribed
  λ=128/989: the aperture minus regulator impedance lies strictly between
  1/2000 and 1/1000. Its physical origin is not proved by its small size. Neither
  side of this match contains v, so the comparison alone cannot select v.
- The hypercharge appendix's linear balances do not uniquely select u/d
  numerators. `Hypercharge` supplies two conditional ways to close the split;
  their representation and coupling premises must still be derived.

The manuscript changes in that pass only update framework naming to
Persistence Mechanics (PM), at Kate's request.
See [NEXT-WORK.md](NEXT-WORK.md) for the remaining physical selection tasks.

## Proof hygiene

`AuditStrict.lean` checks public/private declarations by source module and
namespace and rejects every transitive axiom except `propext`,
`Classical.choice`, and `Quot.sound`. Definitions and theorem hypotheses remain
model inputs even when no custom axioms occur.

## Verification on 2026-10-27

The updated `check.sh` completed successfully: `lake build` (3223 jobs), followed
by the strict transitive axiom audit of all 236 PMNested declarations. Only the
three permitted standard axioms occur. This verifies the formal statements;
it does not discharge the physical selection obligations in NEXT-WORK.md.

## Resource-process derivation (2026-10-27, continued)

Six additional modules address the allocation premises:

| Module | New result |
| --- | --- |
| `ReferenceFrames` | Recoverable, reversible in-band marker framing; maximal payload forces one marker given a mandatory-marker architecture; separate-track and binary-capacity comparisons. |
| `SteadyAllocation` | Indefinite bounded backlog forces zero constant drift, fixing normalized service to workload ratios; the specified workload gives the weak fraction. |
| `RegulatoryBudget` | Cyclic symmetry fixes clock/direction credits; regulatory feasibility is an interval and maximal gain selects its upper endpoint. |
| `ResourceSelection` | An explicit resource-process certificate discharges the earlier allocation equations; a positive-rate witness obeys unit total service capacity. |
| `MatchedRegulation` | Unique positive exact matching solution, feasible with spare capacity, rigorously in (0.1294121, 0.1294122); incompatible with exact maximal gain in the uncorrected model. |
| `FiniteService` | Finite reversible scheduling realization of the weak fraction and the period requirements for its uniform-event interpretation. |

See `FiniteService`, `MatchedRegulation` (module docstring) for theorem scope and the
remaining E8-to-process bridge. These results preserve the manuscript's constants
and expose the distinction between budget feasibility, maximal restoring gain
and exact interface matching.

## Verification of the resource-process pass

On 2026-10-27, the complete updated `check.sh` passed: `lake build` completed
successfully (3231 jobs), and `AuditStrict.lean` checked all 382 PMNested
declarations, including private/generated declarations and transitive axiom
usage. Only `propext`, `Classical.choice` and `Quot.sound` were permitted.
The six new modules contain no admitted proofs, custom axioms or native-decide
proof shortcuts. The manuscript's mathematical text and numerical constants
were unchanged in this pass.

The build/audit log is saved in the task workspace at
`work/paper3-resource-check.log`.

## Independent general-rules layer (2026-10-27)

`PMNested.General` formalizes capacity feasibility, reversible metadata/decoding,
reflected-load budgets and finite-depth conditions independently of the E8
example. `AuditGeneral.lean` checks that it imports no substrate or constants
module and audits its 34 declarations. See [GENERAL-RULES.md](GENERAL-RULES.md).
The general manuscript section and the introduction to the physics application
were updated to expose these conditions.

The complete updated `check.sh` passed: 3236 build jobs; 34 independently audited
general-rule declarations and 416 project declarations in the full strict
transitive axiom audit. Only propext, Classical.choice and Quot.sound were
permitted. The revised general section compiled in isolation; a full-manuscript
PDF was not regenerated because the existing constants.tex include remains
unresolved by the desktop compiler.

## Joint electroweak constants pass

`JointConstants`, `GaugeSpectrum`, `ElectroweakBounds`, and `SurfaceBudget`
connect the constant formulas and expose exact closure conditions. See
[CONSTANTS-STATUS.md](CONSTANTS-STATUS.md) for the per-constant theorem/premise map.
The electron mass relation has a certified relative shortfall of approximately
0.00027312. The common-scale uncorrected gauge response gives W/Z intervals
(78.96,78.97) and (89.57,89.58) GeV, distinct from the calculator's measured-Z
validation. The surface reflected fraction is between 10⁻⁹ and 10⁻⁸ under its
specified interface law and needs an allocated reserve.

At the joint-constants stage, `check.sh` passed with 3240 build jobs, 34
independent general-rule declarations and 480 full strict-audit declarations. The allowed axiom
set remains unchanged. Original constant formulas were preserved; manuscript
claims and calculator diagnostic labels now distinguish these conditions.

## Reference-capacity audit

`General.ReferenceCapacity` strengthens the overhead argument using arbitrary
injective encodings rather than a mandatory reserved marker. It also proves
that static capacity is insufficient for clock compatibility: the 172-symbol
static one-slot code fails both tested moving-reference updates. Physical width,
granularity and cost remain explicit tasks. `General.GridEncoding` adds the
matching sufficiency proof on the actual 4×43 phase grid: for a nonempty
alphabet the threshold is exactly 173. The encoder is choice-based; see
`General/GridEncoding` (module docstring) for the proof outline.
See `General/ReferenceCapacity` (module docstring). The revised overhead
subsection compiled in an isolated syntax check with numeric macros stubbed.


`NEXT-WORK.md` gives the prerequisite order for the remaining work.
`WorkloadLedger` audits a finite weighted operation ledger and distinguishes a
ratio of aggregate work from a mean of per-trial ratios. Its sample/readout model
and relative tolls are explicit premises, not substrate consequences.


Verification at the grid encoding and workload stage: `check.sh`
passed with 3243 build jobs, 131 independent general declarations and 610
PMNested declarations in the strict axiom audit. Only `propext`,
`Classical.choice` and `Quot.sound` are allowed. The revised capacity and temporal
allocation sections passed an isolated LaTeX syntax compilation with numeric
macros stubbed; this is not a full manuscript/numerical-table build.


## Primitive-transition bridge

`TransitionLedger` connects composite address/payload/bus operations to Paper I's
actual `NetCost` event accounting. Equal primitive tolls leave operation lengths
open. A one-event realization of all three classes uniquely minimizes the
positive-integer ledger; its admissibility in the substrate remains to be proved.
Bounded fluid-queue persistence alone does not select the lengths.
`General.Accounting` proves the aggregate share is a work-weighted mean of
per-case shares. See `TransitionLedger` (module docstring).
The independent availability question for Claude is in
`AvailabilityAudit` (module docstring).


Verification at the primitive-transition stage: `check.sh` passed with
3246 build jobs, 139 independent general declarations and 651 PMNested
project declarations in the strict audit. No custom axioms are allowed. The
updated temporal-allocation section also passed isolated LaTeX syntax compilation
with numeric macros stubbed; this does not validate the full manuscript build.


## Phase-grid availability and channel-load balance

`AvailabilityAudit` integrates Claude's supplied mass classification and static
checksum counterexample, using the existing grid and D4 definitions. It proves
that phase invariance alone does not give uniform direction weights or a
per-channel availability factor eta. `SelectedAvailability` supplies uniform
mass conditional on the specified return-cost selection model
(`PMFramework.LawSelection`): its selected law is uniform on the grid and tick
invariant; excluding one cell leaves mass 171/172. The physical candidate family
and scoring law remain application premises. `BalancedAvailability` proves the
aggregate 16 eta along any fixed-direction trajectory given four targets per row and
collision semantics. Suppressing required jobs without recovery is incompatible
with bounded backlog.

`ChannelDirectionLoad` checks the actual minimal glue-class vectors from Paper I:
each eight-vector class has normalized quadratic load two per orthogonal axis,
so any two distinct classes have load four per axis. This proves geometric
balance without choosing point targets. Register-axis identification and a
conservation-preserving operation law remain open. See `AvailabilityAudit` (module docstring)
and `ExclusionLawAudit` (module docstring).


Verification at the availability and channel-load stage:
`check.sh` passed with 3252 build jobs, 139 independent general declarations and
744 PMNested declarations in the strict axiom audit. Only Lean's standard
propext, Classical.choice and Quot.sound are allowed. The three revised gauge/
capacity/temporal sections passed isolated LaTeX syntax compilation with numeric
macros stubbed; a full manuscript build was not performed in this pass.


## Cycle-total service and the relative-maintenance audit

`General.Service` proves finite-cycle queue balance and normalized service shares
for phase-dependent demand and service. Existing `SteadyAllocation` drift theorem
names now delegate to that independent module. `PeriodicAllocation` applies it
to the balanced collision workload, preserving the explicit operational premises.

`General.RelationalEncoding` gives a decoder for reference-value-plus-differences
and proves that dropping the reference value merges constant configurations.
`ExclusionLawAudit` integrates Claude's star workload definitions and exact-update
omission criterion with scope corrections: information retention is not a refresh
cost law; address inequality is not state-value distinction cost. A homogeneous
state proves that the positive edge-density contract does not follow directly
from Paper I's `only_distinctions_cost`. See `ExclusionLawAudit` (module docstring).


Verification at the periodic service and exclusion-law stage:
`check.sh` passed with 4057 build jobs, 153 independent general declarations and
796 PMNested declarations in the strict axiom audit. Only Lean's standard
propext, Classical.choice and Quot.sound are allowed. The revised general-rules
and temporal-allocation sections passed isolated LaTeX syntax compilation with
numeric macros stubbed; a full manuscript/numerical-table build is not claimed.


## Concrete local update and its cost

`LocalMaintenance` classifies reversible population-preserving updates on two
binary sites, embeds the pair at E8 nearest-neighbour addresses, and connects
the selected nontrivial swap's activation event to Paper I's ordered boundary
cost and NetCost. Invariant samples with identical one-site marginals can give
different costs; a two-pair witness also fixes total population. This is an
explicit local contract, not a derived global vacuum update. See
`LocalMaintenance` (module docstring).


Latest complete verification (local update model): `check.sh` passed with
4058 build jobs, 153 independent general declarations and 856 PMNested
project declarations in the strict axiom audit. Only propext, Classical.choice
and Quot.sound are allowed. The revised temporal-allocation section passed
isolated LaTeX syntax compilation with numerical macros stubbed. A full
manuscript/numerical-table build was not performed in this pass.

## Repair space for the joint electroweak residuals

`RepairSpace` separates what can move each certified residual. Across the whole
range `0 ≤ η ≤ 1` the overhead changes only the mixing fraction; `m_W² s` and
`m_Z² s(1−s)` both equal `π α v²` for every η, and no η raises `m_W²` by more
than 0.05% or `m_Z²` by more than 0.04% over the paper's value. A common factor
on `α v²` scales both masses together and reaches a target pair iff the pair has
the model ratio `1 − s`. For the electron, a scalar-field rescaling leaves
`y v/√2` invariant, the Fermi formula pins the rescaling to ±1, and no `√2`
convention moves the certified closure ratio to one. Both residuals therefore
need new response dynamics, not a different η or normalization.

## One interface scale for all couplings

`ScaleConsistency` tests the smallest response family: every coupling readout
uses `k α` for one interface factor `k`, with the VEV fixed. The paper's own
comparison inputs (its Z-mass anchor and the strong window upper edge 0.1189)
are named explicitly. Matching the Z anchor needs `1.0362 < k < 1.0365`; the same
factor puts the strong readout above 0.1221, so no single factor serves both.
The ratio `m_W² = (1−s) m_Z²` holds for every `k` and, with the anchor, gives
`80.3845 < m_W < 80.3846`. For the electron, defining the Yukawa by the mass law
from the VEV closes the relation exactly; written as `y_bare(1 + cα)` it needs
`1.28777 < c < 1.28779`, which excludes the stated `σ/D = 5/4` dressing.

## Scalar interface: what persists

`PersistentGain` resolves the maximal-gain versus exact-matching choice by asking
what persists. Under Closure the reflected load must be paid from the same
regulatory ledger at some charge rate `c ≥ 0`. For every `c > 0`, maximal gain
128/989 is not persistent (positive reflection, zero slack); exact matching is
persistent but leaves slack unused. There is a unique largest persistent gain
`g*`, strictly between the matched gain and 128/989, with
`128/989 − g* < c·10⁻⁸/23`. Economy within persistence therefore selects maximal
gain minus the reflection it must service; exact matching is selected only as
`c → ∞`. The charge rate `c` is not yet derived; for any `c` of order one the
Higgs mass is unchanged at displayed precision.

## What a derived interface factor must contain

`ScaleResponse` narrows the interface factor `k`. Scale homogeneity plus
continuity forces each species' response to be `κ·log` of the scale ratio
(`scale_homogeneous_log`), so one coefficient per species is the freedom. The
calculator's Z-pole coupling `α⁻¹(1−Δα) − η` (comparison input
`0.0589 < Δα < 0.0591`) gives `k > 1.07`, so pure screening at the Z pole is not the
interface coupling. Writing `1/k = 1 − Δα + X` forces `0.0236 < X < 0.0242`: an
opposite-sign (anti-screening) term is required. Deriving the screening
coefficient and this term from the substrate is the open obligation.

## Strong-coupling running test

`StrongRunning` checks the paper's run of `α_s` to the tau mass. With Paper V's
own masses, `m_c < m_τ < m_b < M_Z` (`flavour_order`), so the threshold response
of `ScaleResponse` has five flavours on `[m_b, M_Z]` and four on `[m_τ, m_b]`.
Three flavours throughout gives a strictly larger `α_s(m_τ)`, by an exact log
excess (`three_flavours_inflate`). A multiplicative `15/16` changes the coupling by
`1/16` at every scale (`uniform_factor_scale_free`); at the Z mass it would give
`α_s < 0.1106`. Normalization of sixteen channel probabilities does not fix the
reference channel's share at `1/16` (`locked_channel_share`,
`locked_share_not_forced`).

## One stiffness rule for the gauge readouts

`GaugeStiffness`: if a sector's links are refreshed `W` times per cycle and each
refresh pays the local curvature cost, its stiffness is `β = c₀W`
(`refresh_ledger`) and, with Paper II's D₄ normalization, `g² = 1/(2c₀W)`. Two
sectors then have mixing `W/(W+Y)` and electric coupling `1/(2c₀(W+Y))`. With
`W = Δ` and `W + Y = N_sys` this reproduces all three electroweak readouts
(`paper_electroweak`), so the matching `s = g'²/(g²+g'²)` follows from the ledger.
The same rule gives `α_s/α = N_sys/W₃`; the paper's strong formula needs
`11 < W₃ < 12` (`strong_workload_not_integer`). The rule assumes one
normalization constant per sector; group factors for SU(2), SU(3) and the
hypercharge normalization are part of the open premise.

## Per-sector normalization from the channel content

`StiffnessIndices`: measuring loop cost on the sixteen channel states of a
generation makes each sector's normalization its index: `T₂ = T₃ = 2`
(four doublets, four triplets) and, from the forced charges, `T_Y = 10/3`
(`hyper_index_forced`; `T_Y/T₂ = 5/3`). Mixing is then
`T₂W_W/(T₂W_W + T_Y W_Y)` (`indexed_mixing`). Since `2W_W ≠ 43`
(`clock_ledger_parity`), the paper's `s = Δ/N_sys` needs ledgers counted as
channel-weighted cost. In those units `α_s = α N_sys/L₃`; the paper's formula is
the non-integer `L₃ ∈ (11,12)`, while `L₃ = 12` gives `α_s ∈ (0.11730, 0.11732)`
(`strong_from_ledger`).

## The inter-sector link is the scalar doublet

`SectorLinks`: in Paper II's two-sector domain wall the left- and right-handed
states sit on different D₄ sectors, so each fermion hop between sectors carries
a link field with hypercharge equal to the endpoint difference. All four hops are
carried by one field of hypercharge `h` and its conjugate exactly when Paper III's
`Yukawa Y h` premise holds (`links_iff_yukawa`). For the forced charges every hop
has `|ΔY| = 1` (`standard_links`), and `forced_by_links` restates
`charges_forced` with the domain-wall link in place of the Yukawa premise.

## Anomalies of the two-sector assignment

`ChiralAnomalies`: with left-handed states on one sector and right-handed on the
other, Paper III's flux premise is exactly the three linear anomaly conditions
(gravitational, `SU(3)²U(1)`, `SU(2)²U(1)`; `flux_is_linear_anomalies`). Colour is
vector-like and the four doublets avoid the global `SU(2)` anomaly. The charges
forced by flux, one unit-hypercharge link and a neutral sterile channel also cancel
the cubic `U(1)³` anomaly, which was not assumed (`forced_anomaly_free`).

## W and Z masses from the inter-sector link

`LinkMass`: with weak links on the left-handed sector only, the scalar link is
transported by `θ = (g/2)W·σ + (g'/2)B` (`theta_pauli`). On the vacuum direction
its quadratic cost is `(g²/4)(W₁² + W₂²) + ¼(gW₃ − g'B)²` (`theta_on_vacuum`,
`link_quadratic`), so `GaugeSpectrum`'s neutral form is an output of the link cost
(`neutral_from_link`). With `⟨φ⟩ = v/√2` this gives `m_W² = g²v²/4` and
`m_Z² = (g² + g'²)v²/4` (`w_mass_term`, `z_mass_term`), and `g'W₃ + gB` is free
(`photon_free`).

## The opposite-sign interface term is custodial breaking of the link

`LinkCustodial`: writing `1/k = 1 − Δr`, the Z-anchor window on `k` is
`0.0349 < Δr < 0.0353` (`delta_r_window`), so `k` is the on-shell relation between `α`,
the Fermi readout and `m_W² s`, and `ScaleResponse`'s `X` is `Δα − Δr`. The link cost is
custodial at tree level: `m_W²/m_Z² = g²/(g² + g'²)` for every `v` (`rho_tree`). A doublet
whose two components carry squared masses `a, b` has splitting function
`F(a,b) = (a+b)/2 − ab/(a−b)·log(a/b)`, strictly positive exactly when `a ≠ b`
(`veltman_pos`). So the required term has the sign of link-doublet splitting. With the
imported one-loop normalization `Δρ = 3G_F F/(8√2π²)`, the paper's `s`, Paper III's own
`G_F` and the comparison input `172.28 < m_t < 172.86` GeV, the leading term `(c²/s²)Δρ`
lies in `(0.0324, 0.0327)` (`leading_bounds`). It overshoots `X`, so the non-leading
remainder must be `0.0082 < R < 0.0091` (`remainder_required`). The loop normalization
and the top mass are labelled inputs, like `Δα`; deriving them from the substrate is open.

## The W mass is a parameter-free test of the clock ratio

`WMassTest`: read as the on-shell mixing `s = 1 − m_W²/m_Z²` (the tree-level link relation,
scale-independent by definition), the exact `s = 1849/8295` fixes `m_W²/m_Z² = 6446/8295`
(`mass_ratio_sq`) with no `k`, `α` or VEV. With measured `m_Z = 91.1876 ± 0.0021` GeV,
`80.3827 < m_W < 80.38644` GeV (`w_window`). Pulls against labelled comparison values
(PDG 2025 review): direct world average without CDF `80.3692 ± 0.0133`, between 1.0 and 1.3σ
(`pull_world`); CMS `80.3602 ± 0.0099`, between 2.26 and 2.66σ (`pull_cms`); CDF 2022
`80.4335 ± 0.0094`, below −5σ (`pull_cdf`); Standard Model fit `80.356 ± 0.006`, above 4.4σ
(`pull_sm`). The clock ratio is not the Standard Model mixing: it predicts `m_W` about
28 MeV above the electroweak fit. Correlations between experiments are not modelled. The
calculator's `mw` reference is updated to the PDG 2024 direct average (CDF excluded).

## Only one integer strong ledger survives

`StrongLedgerTest`: in the channel-weighted units that give `s = Δ/N_sys`, the strong readout is
`α_s = α N_sys/L₃`, with `1.40771 < α N_sys < 1.40772` (`alpha_footprint_bounds`). Among positive
integers, `L₃ = 12` is the only count within 3σ of `α_s(M_Z) = 0.1180 ± 0.0009`
(`integer_ledger_unique`): `L₃ ≤ 11` gives more than 0.1279 and `L₃ ≥ 13` less than 0.1083.
`L₃ = 12` gives `0.11730 < α_s < 0.11731` (`ledger_twelve`), a pull of about −0.78σ. Integers
are about 8% apart here, so this is a falsifiable count, not yet a derivation: the colour
refresh count `12` and the matching scale (about 4% above `M_Z` at one loop) remain premises.
The calculator still uses the paper's `(16η + 1/4)α`.

## A real update fixes θ and also forbids the measured CP violation

`CPPhases`: a real update matrix commutes with complex conjugation of amplitudes
(`real_update_commutes_conj`), so it is time-reversal symmetric. All topological winding
weights `e^{inθ}` are then real exactly when `θ ∈ πℤ` (`theta_real_iff`, `real_weights_iff`).
The same reality makes the Jarlskog invariant of any real mixing matrix zero (`jarlskog_real`),
so the paper's nonzero `J` needs a non-real mixing amplitude (`cp_needs_complex_mixing`).
Reality alone therefore cannot be the strong-CP mechanism. What would persist with both
observations is complex amplitudes confined to flavour mixing, with the topological weights
and arg det of the quark mass matrix kept real; deriving that confinement is open.

## Strong CP: Hermitian link masses and the persistent vacuum

`HermitianMass`: the two D₄ sectors are copies of the same lattice, so a persistent link
coefficient is invariant under exchanging them, which maps the link matrix `M` to `M†`
(named premise: `M = M†`). Then `det M` is real (`det_real_of_hermitian`), and with positive
masses `arg det M = 0` (`arg_det_zero`), so `θ̄ = θ` (`thetaBar_eq_theta`). Hermitian masses
still violate CP: an explicit pair has `det[H_u, H_d] = 4i` (`cp_with_hermitian`), and
Paper IV's `CKM.ckm_det` shows complex mixing with `det V = 1`. Of the two values a real
update allows, `θ = 0` persists: with Paper II's positive transfer matrix the winding weights
are nonnegative, `‖Z(θ)‖ ≤ Z(0)` (`theta_zero_maximal`), and any odd sector makes
`Re Z(π) < Z(0)` (`theta_pi_costlier`). Remaining premise: sector-exchange invariance of the
link coefficients. Paper III's separate `J = φ²T_geo η` is superseded by Paper IV's matrix
value (`PMDynamics.CKM.papers_disagree`).

## What fixes the colour ledger (exploration)

`ColourCount`: the data put the strong ledger in `11.66 < L₃ < 12.21` (`ledger_window`, 3σ).
Three structurally different rules land inside (`candidates_in_window`): `12`, the positive
roots of D₄ (`positive_roots`, one refresh per link direction); `16η − 4 ≈ 11.907`; and the
paper's `N_sys/(16η + 1/4) ≈ 11.940`. `11` and `13` are excluded. A per-plaquette rule gives
multiples of 8 (`link_triangles`). The data cannot choose; the choice needs the colour
refresh process. The weak ledger `W = Δ` is itself a premise in `GaugeStiffness`, so one
refresh rule must produce 43 for SU(2), `N_sys − 43` for hypercharge and `L₃` for colour.

## Sector exchange gives the Hermitian link; the doublet phase cancels

`SectorExchange`: write the update generator on the two sectors as `[[A, M], [M', B]]`. If it is
Hermitian (unitary update) and commutes with the sector exchange (combined with parity, so the
wall orientation is a vacuum property, not an obstruction), then `M = M†` (`exchange_hermitian`).
With one link doublet, up-type masses use `v̄` and down-type `v`; for three generations
`det(v̄Y_u)det(vY_d) = |v|⁶ det Y_u det Y_d` (`one_doublet_phase_cancels`), so the vacuum phase
drops out and `θ̄ = 0` (`thetaBar_zero`). Remaining premise, stated as a symmetry: the update
carries no sector label. The two sectors are the same D₄, and a label no observable needs is a
spare coordinate that Economy (`description_minimal`) excludes; this step is argued, not proved.

## Colour refreshes the coloured channels: `L₃ = 12η`

`ColourChannels`: 12 of the 16 channels per generation carry colour (`coloured_channels`).
If colour links maintain the payload of the channels they act on, the colour ledger is that
payload, `12η = 513/43` (`colour_ledger`), with the same reference overhead the footprint charges
every payload channel. Then `0.11799 < α N_sys/(12η) < 0.11800` (`strong_from_channels`), within
0.01σ of `0.1180 ± 0.0009`, and within `0.0001` of the paper's `(16η + 1/4)α` (`close_to_paper`).
The data window is about 0.55 wide in `L₃`, so the rule, not the agreement, is the content.
The same per-channel rule cannot be SU(2)'s: `8η/N_sys < 0.042` (`weak_not_per_channel`). SU(2)
refreshes the clock row, SU(3) the coloured payload; deriving that assignment from the update is
the remaining premise, and it would also discharge `W = Δ`.

## One refresh rule: shared versus per-channel resources

`ResourceLedger`: Paper V's channel table gives each channel two attributes, colour-bulk routing
(channels 1–12) and coupling to the active left-handed temporal boundary (1–6, 13–14). The
boundary is one clock shared by all active channels; colour routing is per channel. Rule: a
sector's per-phase work is one refresh per distinct required resource (duplicates excluded by
Economy, distinct ones required by Conservation). A shared resource costs its own weight however
many channels use it (`ledger_shared`); injective resources add (`ledger_per_channel`). With the
table, SU(2) gets the clock, `43` (`su2_ledger`, discharging `GaugeStiffness`'s `W = Δ`), and
colour gets `12η` (`colour_ledger_rule`). The sterile channel's capacity counts in the footprint:
dropping it (`15η`) puts `m_W` below 80.3268 GeV, more than 3.1σ under the direct world average
(`sterile_counted`).

## One rule, one table: all three gauge ledgers

`GaugeLedgers`: resources per phase are the clock row (43), spatial rows (129), wires (5) and one
payload per channel (`η`). From Paper V's attributes, SU(2) requires the clock (active temporal
boundary), hypercharge requires the spatial rows, wires and every channel's payload including
the sterile reference (boundary flux carried across the spatial grid), and colour requires the
12 coloured payloads. One refresh per distinct required resource gives `43`, `129 + 5 + 16η`
and `12η` (`su2_value`, `hyper_value`, `colour_value`); their electroweak sum is `N_sys`
(`footprint_from_rule`), the mixing is `Δ/N_sys` (`mixing_from_rule`) and the strong readout is
`α N_sys/(12η)` (`strong_from_rule`). Premises: the minimal-refresh rule and this requirement
table; excluding the sterile reference is disfavoured by the W mass (`sterile_counted`).

## The refresh rule from Conservation and Economy

`MinimalRefresh`: a per-phase refresh schedule is admissible (Conservation) when it refreshes
every required resource. Every admissible schedule costs at least `Σ_{r∈R} w r`
(`admissible_cost_ge`); listing each required resource once attains it (`minimal_attained`), so
the Economy-minimal admissible cost is exactly the ledger (`minimal_is_ledger`). With positive
weights, any repeat or unrequired entry costs strictly more (`strict_if_extra`). The refresh rule
used by `ResourceLedger` and `GaugeLedgers` is therefore a consequence; the requirement table is
the remaining premise for the three gauge ledgers.

## The requirement table from representation and forced charges

`RequirementTable`: with each channel's type (`multiplicities`: 6, 3, 3, 2, 1, 1), the colour
column is exactly the colour triplets (`colour_column`), the active-boundary column exactly the
SU(2) doublets (`active_column`), and for charges forced by flux, one unit link and a neutral
sterile channel, nonzero hypercharge holds exactly off the sterile channel 16 (`hyper_column`).
With the sterile channel as the flux reference (Paper V; supported by `sterile_counted`), the
three gauge ledgers rest on representation data already in Paper III, `MinimalRefresh`, and the
reading of SU(2) as the shared temporal boundary and hypercharge as spatial flux.

## Calculator switched to the colour ledger

`StrongLedgerBounds`: with `α_s = α N_sys/(12η)` the regression enclosures are
`1.4827 < 4πα_s < 1.4829` (`ledger_strong_squared`) and, with the Z-anchor factor,
`k α_s > 0.1222` (`ledger_interface_obstruction`). The calculator and `4_B_capacity.tex` now use
this form. Whether colour content weighs `η` or `1` is settled by `ContentWeight` below.

## One contract for all stored content: the colour weight is decided

`ContentWeight`: under Closure, payload and gluon 1-form components are both stored content in
the grid's registers, so one maintenance contract gives one weight `w` to all of it: hypercharge
payload `16w`, colour `12w` (`ledgers_share_weight`). The colour fork is `ExclusionLawAudit`'s
intensive/extensive question. Both contracts persist; the intensive one omits only the
reference's null self-job, so Economy selects it (`economy_selects_intensive`): `w = η`, colour
`12η`. The data agree: summed squared pulls (direct `m_W`, `α_s`) are below 1.70 for `w = η` and
above 2.5 for `w = 1` (`intensive_preferred`). This also settles the workload law behind `16η`.

## Gauge stiffness from Paper II's event law

Paper III's Lean now requires Paper II (`pm_action`, added to `lakefile.toml` and
`lake-manifest.json`). `EventStiffness`: `W` refreshes of a phase test, each a flag readout
repaired by `m` primitive events at the common toll, cost `(c₀W)(1 − cos θ)` with
`c₀ = toll·m/2` (`refresh_from_events`); this is `GaugeStiffness.refresh_ledger`, whose premise is
now derived from Paper II's carrier events. Then `g² = 1/(toll·m·W)` (`coupling_from_events`).
Matching the footprint's electric coupling to Paper I's `α` fixes the only free product,
`toll·m = 1/(4πα N_sys)` (`calibration`), and every gauge coupling follows:
`g_W² = 4πα N_sys/43`, `g_Y² = 4πα N_sys/(129 + 5 + 16η)`, `g_3² = 4πα N_sys/(12η)`
(`couplings_from_alpha`). If the scalar link is priced by the same readout event as the gauge
plaquette, it shares the prefactor `toll·m/4` (`scalar_shares_prefactor`); that sharing is a
pricing premise, not derived.

## The W/Z mass form is the leading event-law link response

`LinkFromEvents`: `‖θφ̂‖² = (g²/4)(W₁² + W₂²) + (1/4)(gW₃ − g'B)²` (`vacuum_generator_norm`), and
by Paper II's `LinkExpansion` the event-law link cost of the vacuum direction is `ε²` times this
form up to an explicit `O(ε⁴)` remainder (`mass_form_from_events`). The W and Z mass terms are the
leading response of the link readout; their prefactor equals the gauge action's under the
common-pricing premise above.

## The scalar sector without the predicted VEV

`ScalarSector`: the persistent gain of `PersistentGain` depends on the reflection charge rate
`c`, but for every `0 < c ≤ 10⁴` it is within `4.4·10⁻⁶` of `λ = 128/989`
(`lambda_insensitive`), far below the resolution of `λ`; `c` need not be derived. With the
measured Fermi constant, `v_F² = 1/(√2G_F)`, the paper's `λ` gives `125.26 < m_H < 125.28` GeV
(`higgs_from_fermi`), a pull of 0.5–0.75σ against 125.20 ± 0.11 (`higgs_pull`). This test uses
neither the VEV formula nor the electron mass. The scale `v` itself is outside the event-law chain.

## How the link sets fermion masses: the Higgs couplings decide

`FermionMassLaw`: Paper II's detuned wall gives `m(m + 1) = δ²` in cutoff units. If the link sets
the detuning cost, `δ² = yv` (law A), the coupling modifier `κ = (v/m)dm/dv` is
`(m + 1)/(2m + 1)` (`kappa_cost`, from the actual derivative in `law_cost`), within `(0.99, 1]`
for `m ≤ 1/100`. If it sets the amplitude, `δ = yv` (law B), `κ = 2(m + 1)/(2m + 1)`
(`kappa_amp`, `law_amp`), within `(1.98, 2]`. Against `κ_τ = 0.92 ± 0.08` (CMS 2022) law A is
within 1σ and law B more than 13σ away (`tau_decides`). Law A reproduces the linear mass law
`m ≈ yv` with an `O(m)` correction.

## Which subtraction the VEV formula can persist with

`VevAccounting`: the measured Fermi constant fixes `246.21957 < v_F < 246.21971`
(`fermi_window`), finer than any accounting choice. With `L = 188` (the 172 addresses and the 16
channels, both frame at unit weight) the VEV formula lies within `8·10⁻⁵` of `v_F`
(`frame_inside`). Counting the 16 as stored payload (`172 + 16η`) puts it above 246.2261
(`payload_outside`); subtracting the whole footprint `N_sys` puts it below 245.876
(`footprint_outside`). So the formula persists only if `ν` counts channels as frame and the wires
are not subtracted; these, the factor `α⁻¹` and the two corrections remain its premises.

## The VEV's structural premises, made sharp

`VevPremises`: any boundary share `s ≥ 1/1000` of the wires puts the VEV formula outside the Fermi
window (`wire_share_excluded`), so the wires must carry no boundary weight. That is their
geometric status: a wire is a 1-cell between nodes and meets a node's closed boundary surface only
at points, occupying no area; the link field lives on the wires rather than in the area it fills.
Under the event calibration the handoff factor is exactly `α⁻¹ = 4π N_sys (toll·m)`
(`handoff_is_footprint_repair`): one footprint-wide repair over the full solid angle per interface
slot, in units of the single repair that maintains the electron. Remaining premises: that the
electron's maintenance is one repair, and the two correction factors.

## Gravitational attenuation from the event law

`DepthEvents`: nothing changes state without an event, so crossing a layer requires one handoff
event; with probability `p` per layer, crossing `n` layers has probability `p^n`
(`required_handoffs`), and no-event histories do not advance (`no_event_no_advance`). This
selects `α` over `1 − α` once the handoff probability is the coupling. The only integer-count
object is the closed 43-handoff loop; time-reversal symmetry of the real update makes the
outbound and return legs equal, so the one-way transmission is uniquely `α^{43/2}`
(`one_way_from_loop`, `gravity_from_events`), with no half-hop. Remaining: the residual factor.

## The channel representation from Paper I's carriers

`CarrierRepresentation`: the eight minimal vectors of the D₄ vector class are `±2eᵢ`, four axes
with two signs (`one_axis`), the `(4, 2)` of `SU(4) × SU(2)` with lepton number as a fourth colour.
Singling out one axis leaves 6 carriers on the other three and 2 on it, with signs splitting evenly
(`lepton_axis_split`, `sign_split`). Reading the three axes as colour and the sign as the doublet
index gives exactly the multiplicities `6, 3, 3, 2, 1, 1` (`multiplicities_from_carriers`). A
traceless lepton-number charge equal on the colour axes, normalized by the forced lepton charge,
is `1/3` per colour axis (`bl_traceless`), and with `Y = B − L (+ 2T₃ on the right)` the carriers
reproduce Paper III's forced charges (`charges_from_carriers`). Premises: both sectors are carried
to the vector class by triality, the sign is the doublet index, and one axis is the lepton axis.

## Three generations as pairs of distinct glue classes (structural candidate)

`Generations`: a generation is two sectors of eight carriers. If both use the same glue class, a
left and a right carrier coincide as substrate vectors (`same_class_loses`), losing a distinction,
so a generation needs two distinct classes (Paper II's `packet_vector_injective` shows that
suffices). With no sector label (`SectorExchange`) generations are unordered pairs, and there are
exactly three among the three nontrivial classes (`three_pairs`); no fourth exists. This is a
candidate count, not yet a dynamical identification: each class is shared by two generations, and
the flavour structure across pairs is not constructed here.

## Neutrino tower: scope and the scale-independent test

`FloorNeutrino` certifies `0.009208 < M_min < 0.009210` eV and the bare tower's
mass-squared upper bound. That bound alone does not test Papers V/VI's proposed
factor-six interaction response. The new `splitting_identity` and
`splitting_ratio` prove that a common multiplier leaves the adjacent squared-mass
splitting ratio at 43²=1849. `no_moderate_gap_ratio` extends the obstruction to
all pairwise gaps, irrespective of their labels. `factor_six_windows` tests the
stated sixfold response explicitly. These conditional identities do not exclude
a different, derived propagation law. See `FloorNeutrino` (module docstring).

## The beta-coefficient rank rule fails its universality test

`BetaUniversality`: the paper's "11 = rank 8 + rank 3" is offered as a universal construction, but
the weak `SU(2)` gauge coefficient is `22/3`, which no natural-number rank sum equals
(`rank_rule_not_universal`). The one rule that gives both is `(11/3)C_A`, with `C_A = σ − χ = 3`
for colour and `C_A = χ = 2` for the weak sector (`casimir_form`); the factor `11/3` itself
remains to be derived from the substrate response.

## The gravitational coupling picks the same accounting as the VEV

`GravityAccounting`: `1.143021965·10⁻⁴⁶ < α^{43/2} < 1.143021969·10⁻⁴⁶` (`attenuation_bounds`).
With `ν = 16` as the channel frame, `α_G = (16 − 2/3 − α)α^{43/2}` lies in
`(1.7517995, 1.7517996)·10⁻⁴⁵` (`channels_as_frame`), inside the CODATA window from
`G = 6.67430(15)·10⁻¹¹` (`inside_codata`, about −0.25σ). Counting the channels as payload, `16η`,
gives `α_G < 1.7412·10⁻⁴⁵`, more than 200σ low (`channels_as_payload`). The Fermi constant and
Newton's constant independently select the same reading: in the scale formulas `ν` is the channel
frame; in the per-phase footprint the payload those channels carry weighs `η`.

## The scalar ledger picks the same channel accounting

`ScalarAccounting`: counting the 23 regulatory labels with the channels as payload, `16η + 7`,
gives `125.52 < m_H < 125.53` GeV with the measured Fermi constant (`payload_higgs`), more than
2.8σ high (`payload_pull`), while the frame count `23` is within 0.75σ. With `VevAccounting` and
`GravityAccounting`, three precision observables select one rule: capacity counts (slots, labels,
residual bandwidth) take the channels as frame at unit weight; per-phase workload takes their
payload at weight `η`.

## The scalar ledger's budget is the integer 3

`ScalarBudget`: with the sync credit `1/43` already forced by clock invariance, only the natural
budget `B = 3` puts `λ = (B − 1/43)/23` within 3σ of the measured `0.12928 ± 0.00023`
(`budget_unique`). The count matches both `σ − χ` and the number of generations; which one the
budget is remains open.

## The gravity residual's boundary-storage term

`BoundaryStorage`: Newton's constant pins the storage term of `B_res = 16 − s − α` to
`0.6662 < s < 0.6670` (`storage_window`). Among `χ/k`, only `k = 3` fits (`chi_over_k`); the
payload-weighted `2η/3` does not (`payload_weighted_excluded`). With the carrier representation,
`2/3 = χ · (1/3)`: the boundary's two units each store the colour-axis lepton-number quantum forced
by tracelessness (`storage_is_charge_quantum`), so the `3` is the colour axes `σ − χ`.

## The W mass decides the ledger reading

`ReadoutAccounting`: the framework's Selection Principle keeps the uniform preparation of the 16
packet carriers (`selected_is_uniform`), whose response indices are the uniform packet indices
2, 2, 10/3 (`selected_indices`). Read as raw refresh weights, the ledgers then give
s = 5547/37777 and 84.22 < m_W < 84.24 GeV, more than 289σ above the direct average
(`raw_excluded`); read as effective stiffness they give the manuscript value within 1.3σ
(`ledgers_are_effective`). So the ledgers already contain their trace indices, and
`GaugePersistenceChoice`'s raw-floor throughput criterion is not the operative selection.
Open: derive the effective ledgers as primitive work (why 43 and 129 + 5 + 16η carry the
indices 2 and 10/3).

## Generator normalization: charge units, not the trace form

`GeneratorNormalization`: a ledger fixes the stiffness of a sector's unit generator. Equal packet
trace for every unit (the natural internal candidate) makes the hypercharge unit √(3/5)·Y/2, a
unified-group normalization (equal ledgers give s = 3/8, `unification_value`), and with the actual
ledgers gives exactly the raw, W-mass-excluded value (`trace_form_gives_raw`,
`normalization_decided`). Charge units (T₃ = ±1/2, Y/2 from Q = T₃ + Y/2) give the manuscript
value (`charge_units_give_effective`). On the packet the electric charge is the plain sum of the
unit generators exactly in charge units (`plain_sum_iff`, `electron_charge`), and not in
trace-form units (`trace_units_not_plain_sum`). Open: derive from the event law that refresh
stiffness is counted per unit of conserved charge.

## The common reference carrier

`ReferenceCharge`: a refresh's stiffness is the comparison response of its reference carrier.
For a single-type reference the weak and hypercharge indices are that type's summed T₃² and
(Y/2)²: Q (3/2, 1/6), L (1/2, 1/2), u, d, e and n no weak response (`reference_indices`). Weak and
hypercharge have equal nonzero response on a common reference exactly for the lepton doublet
(`equal_response_iff`), giving the manuscript weak fraction (`lepton_reference_mixing`); a quark
reference gives 16641/23087 and the uniform packet the raw 5547/37777. The lepton doublet has no
colour (`lepton_reference_no_colour`), so colour has its own reference (the 12η ledger).
A reference responding to both refreshes and untouched by colour is exactly L
(`shared_colourless_reference_iff`). Premises: weak and hypercharge share one reference type,
and colour actions do not disturb it.

## One reserved cell, one reference

`SharedReference`: the in-band reference with maximal payload (the premise behind η = 171/172)
reserves exactly one cell (`reserved_single`). With one reserved cell per distinct reference type,
the weak and hypercharge refreshes share their reference (`shared`); a type responding to both is
Q or L (`responsive_iff`); Q puts m_W in (48.1, 48.3) GeV, over 2400σ low
(`quark_reference_excluded`), and L gives the manuscript value within 1.3σ
(`reference_selected`). Colour cannot use the reserved reference (`colour_not_reserved`: only Q
responds to all three). `witness` shows the layout premises are satisfiable.

## Colour reads the payload

`ColourReference`: the reserved cell carries the colourless lepton-doublet reference, so a
colour-responsive reference lies in the payload (`colour_reference_in_payload`). Each payload cell
carries η (`payload_weight`), and the Economy-minimal refresh of the twelve coloured channels
(`coloured_card`) costs exactly 12η (`colour_ledger_minimal`), giving α_s in (0.11799, 0.11800)
(`strong_from_payload`). "Colour maintains the payload, not the reference" is now derived.

## What the lepton-doublet reference supplies elsewhere

`ReferenceAnchor`: the lepton-doublet reference is not invariant under the paired lepton/colour
reflection (`lepton_reference_breaks_root`), which is exactly the readout asymmetry
`PrimitiveReadoutSymmetry.current_readouts_break_root` showed the current readouts require. On
the reference type Q = T₃ + Y/2 is 0 and −1 (`reference_charges`): the electron is the reference's
only carrier read by the unbroken charge (`electron_unique_charged_reference`), so the VEV's
electron anchor is the reference's electrically readable carrier.

## What the reference leaves unbroken

`ReferenceStabilizer`: a real electroweak generator `weakGen A + b·Y/2` (A Hermitian, traceless)
annihilates the reference's neutral carrier exactly when it equals `b·Q`, Q = T₃ + Y/2
(`electroweak_stabilizer`); on the electron carrier Q itself is broken
(`charged_carrier_breaks_charge`), so a reference that keeps Q sits on its neutral carrier. Every
colour generator fixes both reference carriers (`colour_unbroken`), while a quark carrier is moved
by a colour generator (`quark_reference_breaks_colour`). So the selected reference gives
SU(3)×SU(2)×U(1)_Y → SU(3)×U(1)_Q at the level of generators fixing the reference carrier. Not
derived: that the maintained reference is a single carrier vector, and the dynamics holding it.

## The scalar budget counts the directions that move the reference

`ReferenceDirections`: writing a real electroweak generator as `weakGen [[a, z̄], [z, −a]] + b·Y/2`,
it fixes the neutral reference carrier exactly when its displacement `(a − b/2, z) ∈ ℝ × ℂ`
vanishes (`fixes_iff`). The displacement is onto (`displacement_surjective`), so of the four real
directions (`generator_dim`) one fixes the reference and three move it (`displacement_dim`). The
budget singled out by `ScalarBudget.budget_unique` is exactly that count
(`budget_is_moved_count`). Premise: one unit of regulatory budget per independent moved direction
(Conservation restores each, Economy adds none for fixed ones). σ − χ and the generation count are
also 3; this is the reading that refers to the scalar's task.

## Equal gain from maximin; 23 pinned once the budget is

`RegulatoryMaximin`: with `Σ g + 1/43 ≤ B`, some label gets at most `(B − 1/43)/N` (`min_gain_le`)
and an allocation whose least gain reaches it is the equal one (`maximin_forces_equal`), so equal
gain is the maximin allocation rather than a premise. Full one-update restoration of the
reference's displacement is the identity, with trace 3 (`full_restore_trace`), which is the unit
per moved direction. With B = 3 only N = 23 fits the measured λ (`count_unique`); λ alone does not
pin the pair, as (7, 54) also fits (`pair_not_pinned`). Open: 23 as ν + σ + χ, and one-update
restoration.

## Finite restoration, amplitude reading, and the decomposition of 23

`ReferenceRestoration`: any restorer returning every displacement after finitely many updates has
`1 − K` nilpotent, so `tr K = 3` (`finite_restore_trace`); one-update restoration is not needed. (Superseded as the
budget's route by `RepairBudget`, which needs no nilpotence premise.)
A diagonal (occupation) reading of the reference, pure or mixed, commutes with both `T₃` and `Y/2`
(`diagonal_reading_keeps_both`), which are independent (`neutral_independent`), so it would leave
two massless neutral bosons; the reference is maintained as an amplitude. Among sums of distinct
Paper I inputs {4, 43, 16, 32, 5, 2, 172, 31}, only ν + σ + χ equals 23 (`unique_decomposition`).
Premise: the regulatory labels are a set of distinct architecture inputs.

## The link carries the reference's charge: the sterile channel is derived

`ReferenceLink`: the inter-sector link is the scalar, the regulator of the lepton-doublet reference.
Carrying that type's hypercharge up to conjugation, with flux and the unit link, gives the standard
charges and `Y_ν = 0` (`neutral_from_reference`); the other sign only swaps which singlet is
neutral (`conjugate_or_same`); `neutrality_needed`'s alternative has `Y_L = 0`
(`unmatched_link_fails`). `ν_R` is fixed by every colour, weak and hypercharge generator
(`sterile_singlet`) and is the only such channel (`sterile_unique`). `asymptotic_trace_free`:
asymptotic restorers `k·1`, `0 < k < 2`, have trace `3k`, so exact restoration is what fixes B = 3.
Premise: the link carries the reference type's hypercharge.

## The reference's gauge mass form

`ReferenceMasses`: on the neutral reference carrier `⟨T₁²⟩ = 1/4` (`charged_entry`) and the neutral
form read from `gT₃, g'Y/2` (`form_from_reference`) has determinant 0, null vector `(g', g)` and
trace `(g² + g'²)/4` (`neutral_form`), so `m_W²/m_Z² = g²/(g² + g'²)`, tree-level ρ = 1 (`rho_one`).
Among multiplets with T ≤ 3/2 only the doublet gives ρ = 1 (`rho_multiplet`). A doublet of
hypercharge h has charges (h ± 1)/2, equal to the displacement charges {0, ∓1} iff |h| = 1
(`link_charge`). Colour fixes exactly the four leptonic channels and moves the other twelve
(`colour_moves_iff`, `colour_moved_card`).

## Economy places the references

`ReferenceEconomy`: pricing the reserved cell as already paid and any other reference at η, the added
cost of reserved type t is η·(3 − #served t) (`served_correct`), so every served sector reads the
reserved cell (`reads_reserved`). Unconstrained, Economy picks Q (`economy_unconstrained`); among
colour-preserving types (`colour_unbroken_iff`) it picks exactly L (`economy_selects_lepton`), so L
follows without the W mass, which becomes a check. If each cell holds one carrier state, distinct
types occupy distinct cells (`cell_inj_of_content`). These discharge `SharedReference`'s two premises.

## Closures by persistence

`PersistenceClosures`: on a finite discrete state space a convergent restorer is exact after a
uniform number of updates (`finite_restorer_exact`); such a map is not a closed reversible update
(`reversible_cannot_collapse`), and its link to the linear restorer is open. A restoring pairing
is phase-invariant for all θ iff the charges are opposite (`invariant_iff`); with Y_L = −1 this gives
h = 1 and the standard charges (`link_from_covariance`). With the unit winding weighted,
`Re Z(θ) < Z(0)` for all θ ≠ 0 in (−π, π] (`strict_vafa_witten`), so θ = 0 is the unique least-cost
vacuum when cost is read from Re Z (`strict_selects_zero`); |Z| alone does not single it out
(`abs_not_unique`). The anchor's maintenance count is the least positive count, 1
(`one_repair`; count only). A repeated label lowers every label's maximin gain
(`repeat_lowers_margin`), so the labels are distinct.

## The reference singles out the lepton axis

`ReferenceAxis`: the reserved cell holds one carrier state and each carrier lies on one axis, so the
reference picks one axis. A Hermitian SU(4) generator fixes it iff it is the zero-extension of a
Hermitian generator on the other three axes with the same trace (`axis_stabilizer`, `ext_hermitian`,
`ext_trace`): colour is the stabilizer of the reference's axis, giving 4 − 1 = 3 colours. B − L is
moved by the reference (`bl_broken`). Skipping maintenance under any positive drift exceeds every
tolerance (`skipped_maintenance_fails`), so the reference's upkeep is required work. This discharges
`CarrierRepresentation`'s lepton-axis premise.

## The frame rows of the electroweak ledgers

`RequirementRows`: the frame's four rows are the lattice directions, as are the carrier axes. Among
time-fixing axis permutations, 6 also fix the reference axis if it is time and 2 otherwise
(`axis_symmetry_kept`), so Economy puts the reference, and the lepton axis, on time. With every row
refreshed once by a frame-reading sector, weak forced onto the reference row and only there, the
assignment is weak = clock row, hypercharge = three spatial rows (`rows_assigned`), giving 43 and 129
(`frame_ledgers`, `frame_matches`). The row-axis identification commuting with all axis permutations is the identity
(`identification_is_identity`). Premises: rows and axes are both the lattice directions; weak acts
on the frame only through the reference. Wires and payload in the hypercharge set remain.

## Hypercharge is the complement; colour routes per channel

`RequirementComplement`: if every resource of the phase is refreshed once by weak or hypercharge and
weak is confined to the clock row, hypercharge refreshes exactly `reqY` — spatial rows, wires, all
16 payloads (`hyper_is_complement`, `hyper_ledger`). Colour, with no frame-stored reference, restores
each moved channel: the 12 non-leptonic ones, 12η (`colour_requirement`). The weak/colour asymmetry
is whether the sector's frame is stored in the reference.

## The derived table end to end

`TableConsequences`: `Premises` keeps only the refresh assignment (clock row to weak, weak confined
to it). From it: the assignment is the table (`assignment`); s = 1849/8295, 0.11799 < α_s < 0.11800,
the sterile payload in hypercharge, and the W mass within 1.3σ (`end_to_end`); the two sets are
disjoint with ledgers summing to the footprint, so the electric matching is the partition sum
(`electric_partition`). `sterile_counted` is now a check. A witness shows the premises satisfiable.

## Where each readout is matched

`ReadoutScales`: a real electroweak generator commutes with Q iff it has no charged component
(`commutes_iff`); among those, exactly one real direction moves the reference, the Z
(`neutral_broken_iff`). Colour's payload comparison must conserve Q and read the reference, so the Z is
its structural candidate (that the matching scale is its mass is a premise); the electric readout at zero momentum (Q unbroken), the weak mixing on the W/Z
shell. Test (one loop, five flavours): reading the colour value at M_W, m_H, v implies
α_s(M_Z) < 0.1162, > 0.1227, > 0.1296, beyond 2σ, 5σ, 12σ (`at_W`, `at_H`, `at_v`); M_Z gives it
within 0.012σ (`at_Z`). Open: why α in the colour formula is the zero-momentum value.

## Running coefficients come from Paper II

`RunningLinks`: the coefficients in `ReadoutScales`, `StrongRunning` and `BetaUniversality` are values
of `PMAction.RunningCoefficients.b0` / `spinTerm` (`readout_scales_coefficient`,
`threshold_coefficients`, `gauge_coefficient`). Their substrate derivation is tracked in Paper II.

## Paper II's dynamics on the derived content

`MatterRunning`: per-generation indices are the packet traces 2, 2, 10/3 (`weak_index`, `colour_index`,
`PacketTraceForm.hyper_trace_square`); with three generations and the unit link doublet,
`b₃ = 7, b₂ = 19/6, b_Y = −41/6` (`standard_coefficients`). On the reference `m_W² = g²v²/4`
(`mWsq_eq`), and Paper II's contact matching gives `G_F = 1/(√2 v²)` (`fermi_from_reference`).

`HyperScope`: of the support-based hypercharge scopes in `SectorCapabilities`, the relative-phase
scope (14 channels) puts m_W more than 7.7σ low (`relative_scope_excluded`) and the absolute-charge
scope (15) more than 3.1σ low (`sterile_counted`); whole-phase coverage (16) is within 1.3σ. An
empirical selection among stated scopes, not a derivation.

## The uniform preparation is an instance of law selection

`PreparationSelection`: the raw-rescuing law `(6,3,6,3,2,2)/73` on `(Q,u,d,L,e,ν)` carriers is a
positive law distinct from uniform (`rescue_law`, `rescue_ne_uniform`). For `{uniform, rescue}`, and
for any finite positive family containing uniform, positive initial weights and actions at each
law's average rate concentrate survivors on uniform (`preparation_selected`,
`any_family_selects_uniform`, via `PMFramework.LawSelection.selected_uniform_average`). Premise: the
carrier preparation is the framework's survival model with the average-rate reading.

## The colour formula pairs α(0) with α_s(M_Z)

`ScalePairing`: reading the electric coupling at M_Z too (1/α(M_Z) in (127.94, 127.96)) gives
α_s > 0.1263, more than 9σ high (`same_scale_excluded`); with α(0) the formula is within 0.012σ. So
the ledger ratio relates each coupling at its own matching point. Why is open.

## The 23 labels are the coordinates of a link hop

`RegulatoryLabels`: a hop of the scalar link is indexed by (channel, wire, boundary unit); its labels
are the coordinate values, ν + σ + χ = 23 (`label_count`). With first-order hop deviations
`d(c) + d(w) + d(b)`, regulating a label set removes every displacement iff it contains all labels
(`restores_iff`); a missing label leaves one (`missing_label_fails`). Joint configurations would be
160 labels (`joint_count`), excluded by Economy and by λ (`joint_excluded`). Premises: the hop's
three coordinates; first-order deviation.

## What the Fermi window says about the VEV corrections

`VevCorrections`: dropping δ_noise leaves the window (`noise_needed`); a noise divisor k fits iff
k ∈ {3, 4} (`divisor_window`). Replacing 1 + α/D_eff by exp, 1/(1 − x), α/D or 3α/(4π) leaves the
window (`exp_excluded`, `geometric_excluded`, `bare_dimension_excluded`, `qed_like_excluded`).
The window pins D_eff to (4.1584, 4.1599) (`dimension_window`); among 4 + a/(bπ), b ≤ 200, only
a/b = 1/2, i.e. χ/(4π), fits (`boundary_unique`). Readings (premises): the linear form is one repair (`PersistenceClosures.one_repair`); the divisor 3
counts the axes orthogonal to the time-axis reference.

## Photon and Z currents from the reference

`NeutralCurrent`: rotating onto the null vector of the reference's neutral mass form, the photon
couples to e·Q with e = gg'/N (`photon_coupling`) and the Z to N(T₃ − s²Q) (`z_coupling`),
N = √(g² + g'²). So 1/e² = 1/g² + 1/g'² (`electric_matching`), the matching that
`TableConsequences.electric_partition` reads as a ledger sum. The photon direction is null
(`photon_is_null`) and the Z carries N²/4 (`z_mass`).

## Module notes

Older topic notes were removed once their content was in Lean; each module's docstring is now the
reference. Modules not otherwise described above: `CarrierActions`, `CarrierImplementation`,
`CarrierPhaseResponse` (actual carrier operations and their response), `ColourGeometricLoad`,
`ColourPhaseMaintenance`, `ColourRefreshCadence`, `ColourRouting` (colour load, phase maintenance,
cadence and routing), `MeanTraceResponse`, `LinkEvolution` (trace response; spectral evolution as the
exponential).

## The scalar budget from one exact repair

`RepairBudget` (using Codex's `PMAction.DifferentialRestoration.net_gain_trace`): a complete repair
with any records and clock states that restores every small displacement of `D = ℝ × ℂ` exactly has
total net-correction gain 3 (`repair_gain`), with no nilpotence premise. Every displacement is an
electroweak drift's (`drift_covers_neighborhood`), so exactness means every small drift is
repaired. If the budget is the total restoring gain of one complete repair, B = 3 and N = 23 fits λ
(`budget_from_repair`). A reset witness shows the premises satisfiable. Codex's
`research/restorer-bridge` shows finite configuration data alone does not fix the gain.

## Budget readout and stable readout (2026-10-29, late)

- `BudgetReadout`: an exact repair's net-correction derivative is the identity
  (`repair_derivative_id`), so any linear, frame-independent readout counting one restored direction
  as one unit reads `3` (`budget_readout`); the trace is one (`trace_is_readout`). Counting the
  repair as one event is excluded by λ (`single_unit_excluded`). The record keeps at least three
  directions (`record_at_least_three`), so renewing it at one unit per direction from the budget
  misses λ (`renewal_per_direction_excluded`): the 1/43 credit is not per-direction record renewal.
- `StableReadout`: at one loop a coupling takes the same value at two scales iff it does not run
  there (`stationary_iff`); an abelian coupling stops running exactly when no charged matter is
  active (`abelian_stationary_iff`), colour never does (`colour_never_stationary`). So α is read on
  its plateau below the electron (α(0)) and colour at a reference scale (`pairing`).
- `research/repair-budget/RecordRenewal.lean`: Paper II `RecordTransport` forces one clean record per
  exact repair; no finite supply sustains maintenance (`no_finite_supply`).
- `StableReadout.anchor_is_Z`: colour's charge-blind readout can only be anchored on a direction
  commuting with `Q` that is broken; that is the `Z` line alone, whose scale is the neutral form's
  nonzero eigenvalue (the photon direction is null). The data tests at W/H/v become checks.
- `BudgetReadout.ledger_from_readouts`: with the same readout unit, the clock's single phase
  direction re-synchronized once per cycle is `1/43` per phase, so both terms of `(3 − 1/43)/23`
  are readouts in one unit.
- `NoiseShare`: exact repair leaves no residual on the reference's (time) axis; with symmetry under
  the axis permutations fixing it, the VEV noise is `Y/3` per spatial axis (`share_spatial`), and the
  divisor-4 reading would leave `Y/4` on the reference (`four_needs_residual`).
- `VacuumModulus.strict_modulus`: with the zero-winding and unit-winding sectors weighted,
  `‖Z(θ)‖ < Z(0)` for every `θ ≠ 0` in `(−π, π]`; the `abs_not_unique` example lacks winding 0.
- `WallParityExchange`: Paper II's `WallExchange` shows that swapping the walls together with the
  spinor parity `β` (and `k → −k`) maps the domain-wall Hamiltonian with link `Y` to the one with
  `Yᴴ`. So invariance makes the link Hermitian (`link_hermitian`), and with positive spectra
  `θ̄ = θ` (`thetaBar_from_exchange`). This makes precise the parity remark in `SectorExchange`.
- `ChannelOccupancy`: tagging channels by (colour dimension, weak dimension, `6Y`) shows the sixteen
  channels are one generation with `ν_R` (`occupancy`), the hypercharge diagonal matches
  (`charge_entries`), and no channel is left for an extra state such as a superpartner
  (`no_spare_channel`).
- `ReflectionCharge`: reflected amplitude `√R ψ` has `R` times the response (`reflected_response`),
  so the reflection charge rate is the complete repair's readout, `c = 3` (`charge_rate`); then
  `128/989 − g* < 1.4·10⁻⁹` (`gain_at_three`).
- `WallParityExchange.thetaBar_from_light`: the light chiral masses are the seesaw image
  `δ² Y⁻¹` of the inter-wall link (Paper II `WallSeesaw`); positive links give `θ̄ = θ` for them.
- `VevReadout`: an exact repair's net correction is the displacement (`exact_net_is_identity`), so
  one repair gives `1 + x`; a re-repaired residual `r` gives `1 + x/(1−r)` (`residual_series`);
  `n ≥ 2` partial repairs exceed `1 + x + x²/4` and are excluded (`compound_excluded`). With exact-repair
  shares, any normalized spatial readout reads `Y/3` (`normalized_share`); an unnormalized total is
  excluded (`total_excluded`); weighting the time axis gives `(1−w₀)Y/3` (`time_weight`).
- `VevEvent`: a comparison fires only if the transport moves the reference (`flag_zero_iff`); the
  time-axis transport is the maintenance update, which exact repair fixes, so it never fires
  (`time_never_fires`). Conditioning on a readout event gives `Y/3` for any prior axis law
  (`vev_reads_spatial_share`).
- `ReferenceWalkParity`: Paper II's native vacuum reference walk (a carrier-label permutation)
  commutes with swapping its two streams and reversing space (`walk_parity`); its stationary
  backgrounds are exchange-invariant (`backgrounds_agree`). This is the native form of the
  wall-parity symmetry; positivity of links is not addressed.
