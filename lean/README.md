# PM-3-Nested: constants and selection constraints in Lean

Lean 4.34.1. The package depends on the sibling `PM-1-Arch/lean` package and its pinned mathlib
cache, the sibling `PM-2-Action/lean` package for carrier events and readout, and `PM/lean` for the
framework selection theorems. Keep these paper folders as siblings, then run:

```sh
source ~/.elan/env
./check.sh
```

The dependency direction is Paper I → Paper II → Paper III. Run Paper II's `check.sh` before this
one. Only `propext`, `Classical.choice` and `Quot.sound` are permitted; no `sorry`, custom axioms or
`native_decide`.

## Where to look

| Document | Contents |
| --- | --- |
| [VERIFICATION-STATUS.md](VERIFICATION-STATUS.md) | Build and audit status; the module holding the current statement of each result; what remains an input; what Paper III takes from Paper II; downstream use; research files |
| [CONSTANTS-STATUS.md](CONSTANTS-STATUS.md) | Each constant, what Lean checks, and what its physical derivation still needs |
| [GENERAL-RULES.md](GENERAL-RULES.md) | The substrate-independent `PMNested.General` layer (capacity, encoding, matching, nesting, service) |

Each module's own docstring states its scope and premises; it is the authority for that module.
The dated pass-by-pass history of this package is in git history (earlier versions of this README).

## Entry points

- `CurrentConstants.current_snapshot`: the current manuscript values.
- `TableConsequences.end_to_end`: the weak fraction from the derived requirement table.
- `ChainCouplings.chain_couplings`: all three couplings from Paper II's D₄ gauge action.
- `SectorObligations`: the reference/update contract (exact refresh, weak ownership, colour reads).
- `ReadScale`, `OnShell`: the matching scales from persistence and frame independence.
- `VevEntry`: how the vacuum value enters the fermion masses (law A).

## Certified model values

All interval endpoints are exact rationals in Lean.

| Quantity | Proved open interval |
| --- | --- |
| Geometric admittance α | (0.007297352562, 0.007297352563) |
| Current colour-ledger strong coupling | (0.11799520370, 0.11799520373) |
| Weak fraction | (0.2229053646, 0.2229053647) |
| Scalar self-coupling | (0.1294236602, 0.1294236603) |
| Current VEV-defined electron Yukawa | (0.00000293502845, 0.00000293502847) |

These are enclosures of the model formulas, not measurements. A mass input supplies the overall
unit; lattice dimensionless data do not supply an independent GeV scale.

## Module index

Generated from `PMNested.lean`'s imports (in import order) and each module's docstring heading.
`ControllerAdmissibility` and `ControllerTransferWitness` are in `PMNested/` but not imported.

| Module | Subject |
| --- | --- |
| `General` | Aggregator for the substrate-independent general rules ([GENERAL-RULES.md](GENERAL-RULES.md)) |
| `Partition` | Conditional arithmetic of the paper's partition rules, with no empirical identification. |
| `Depth` | Positivity of the stipulated gravity formula; Planck normalization and impedance ordering |
| `ReviewChecks` | Small review checks: tensor trace 8·3 = 24; idempotent projections have eigenvalues 0 and 1 |
| `Interface` | Exact versions of reversible remainder storage and a chosen real impedance |
| `Hypercharge` | Charge selection from specified conservation and coupling constraints |
| `Allocation` | What allocation equations select, and what finiteness does not select |
| `Electroweak` | The proposed electroweak constants and their dependency graph |
| `Bulk` | Bulk propagation and the thermal floor |
| `Matching` | Exact interface matching is distinct from a small mismatch. Its unique |
| `CertifiedConstants` | Certified geometric values inherited from Paper I. Decimal endpoints are |
| `ReferenceFrames` | An internal reference and its resource cost |
| `SteadyAllocation` | Allocation from persistent finite queues |
| `RegulatoryBudget` | Clock credit and maximal uniform regulation |
| `ResourceSelection` | From specified resource processes to the allocation equations |
| `MatchedRegulation` | Exact matching selects a feasible gain with spare capacity |
| `FiniteService` | A finite scheduling witness and its quantization limit |
| `JointConstants` | Joint checks on the proposed electroweak constants |
| `GaugeSpectrum` | The neutral quadratic response and derived gauge mass relations |
| `ElectroweakBounds` | Certified consequences of the proposed formulas. `electronGeV` is the |
| `SurfaceBudget` | Apply the general reflected-load criterion to the stated Higgs/aperture |
| `WorkloadLedger` | Before selecting a coupling: what does the workload average count? |
| `TransitionLedger` | Primitive transition tolls versus composite operation costs |
| `AvailabilityAudit` | Availability measures and event semantics on the actual phase grid |
| `SelectedAvailability` | The availability mass is the selected law |
| `BalancedAvailability` | Collision semantics can give the aggregate payload count along each single |
| `ChannelDirectionLoad` | Quadratic direction loads of the actual minimal D4 glue-class vectors. |
| `PeriodicAllocation` | Allocation from cycle totals of the balanced collision model. |
| `ExclusionLawAudit` | Exact-update omission and conditional relational-load contracts |
| `LocalMaintenance` | A concrete local conservative transition and its measured cost |
| `RepairSpace` | Which changes could repair the joint electroweak residuals? |
| `ScaleConsistency` | One interface scale for all couplings? |
| `PersistentGain` | What persists at the scalar interface: maximal gain that pays for its own reflection |
| `ScaleResponse` | What a derived interface factor must contain |
| `StrongRunning` | The strong-coupling running test to the tau mass |
| `GaugeStiffness` | One rule for the gauge readouts: link stiffness proportional to refresh workload |
| `StiffnessIndices` | Per-sector normalization from the generation's channel content |
| `SectorLinks` | The inter-sector link is the scalar doublet |
| `ChiralAnomalies` | Gauge anomalies of the two-sector assignment |
| `LinkMass` | W and Z masses from the inter-sector link |
| `LinkCustodial` | The opposite-sign interface term as custodial breaking of the link |
| `WMassTest` | The W mass as a parameter-free test of the clock ratio |
| `StrongLedgerTest` | Only one integer strong ledger survives |
| `CPPhases` | A real update fixes θ, and also forbids the measured CP violation |
| `HermitianMass` | Hermitian link masses: θ̄ = θ, with CP violation still allowed in mixing |
| `ColourCount` | What fixes the colour ledger: an exploration |
| `SectorExchange` | Sector exchange makes the link mass Hermitian; one doublet's phase cancels in θ̄ |
| `ColourChannels` | Colour refreshes the coloured channels: `L₃ = 12η` |
| `ResourceLedger` | Shared versus per-channel resources: one rule for the weak and colour ledgers |
| `GaugeLedgers` | One rule, one table: all three gauge ledgers |
| `MinimalRefresh` | Compatibility names; generic schedule proofs now live in Paper II. |
| `RequirementTable` | The requirement table from the representation and the forced charges |
| `StrongLedgerBounds` | Certified enclosures for the colour-ledger strong coupling |
| `ContentWeight` | Conditional comparison of common stored-content weights |
| `EventStiffness` | Gauge stiffness from Paper II's event law |
| `GaugeGroupFactor` | Gauge group factors from the event-priced D₄ action |
| `ReferenceStiffness` | Reference stiffness from the event-priced D₄ continuum limit |
| `ChainCouplings` | All three gauge couplings from the event-priced D₄ chain |
| `ScalarNormalization` | Scalar normalization from the event-priced D₄ chain |
| `RunningResponseLink` | Matter running coefficients from Paper II's spin and orbital response |
| `RunningDerived` | Paper III's running tests on derived coefficients |
| `WeakSpectrumLinks` | Paper II's W-exchange vertex and exact wall spectrum, applied to Paper III |
| `VevEntry` | How the VEV enters the wall masses: the inter-wall link is excluded |
| `SectorObligations` | Sector obligations from the record bound and the reference repair |
| `ReadScale` | One rule for both matching scales |
| `OnShell` | Why an executing mode is read at its mass |
| `LinkFromEvents` | The W/Z mass form is the leading event-law link response |
| `ScalarSector` | The scalar sector against data without the predicted VEV |
| `FermionMassLaw` | How the link sets fermion masses: the Higgs couplings decide |
| `VevAccounting` | Which subtraction the VEV formula can persist with |
| `VevPremises` | The VEV's two structural premises, made sharp |
| `DepthEvents` | The gravitational attenuation from the event law: why `α`, and why `α^{43/2}` |
| `CarrierRepresentation` | The channel representation from Paper I's carriers |
| `Generations` | Three generations as the pairs of distinct glue classes |
| `FloorNeutrino` | Bare thermal tower and common-scale splitting obstruction |
| `BetaUniversality` | The rank rule for the beta coefficient fails its own universality test |
| `GravityAccounting` | Which channel count the gravitational coupling can persist with |
| `ScalarAccounting` | The scalar ledger picks the same channel accounting |
| `ScalarBudget` | The scalar ledger's budget is the integer 3 |
| `BoundaryStorage` | The gravity residual's boundary-storage term |
| `CarrierActions` | Actual finite carrier operations behind two representation columns. |
| `CarrierImplementation` | A finite register realization of the carrier actions. This is a local |
| `CarrierPhaseResponse` | Hypercharge-sensitive carrier readout. The existing charge/axis premises |
| `CarrierSwapSchedule` | Concrete reversible two-field implementations of the carrier gates. |
| `ColourRouting` | Paper V's internal-address interpretation, as a precise finite quotient. |
| `ColourRefreshCadence` | Capability, requests and refresh cadence are distinct operational contracts. |
| `ColourPhaseMaintenance` | Phase-response constraints on maintenance weights. Three balanced diagonal |
| `ColourGeometricLoad` | Actual carrier quadratic load restricted to colour, under the existing |
| `CurrentConstants` | Public snapshot of the current manuscript formulas. The old dressed Yukawa |
| `LinkSpectralResponse` | Discharge spectral data from the actual W/Z link response. The spectral |
| `LinkEvolution` | Paper III compatibility names and the W/Z specialization. |
| `PacketGaugeActions` | Common unitary weak and colour actions on the actual packet, with the |
| `PacketTraceForm` | Exact quadratic trace form of the common packet representation. These |
| `MeanTraceResponse` | Controlled quadratic response of uniform comparison on a finite Hermitian |
| `GaugeTraceNormalization` | Consequences of the actual packet trace indices for the ledger reading. |
| `SelectedColourLoad` | Close the conditional selection-to-colour chain for an arbitrary positive |
| `GaugePersistenceChoice` | What persistence selects once work has an operational meaning. |
| `ReadoutAccounting` | The W mass decides how the gauge ledgers enter the coupling law |
| `GeneratorNormalization` | Which generator normalization the gauge ledgers price |
| `ReferenceCharge` | The common reference carrier fixes the charge-unit normalization |
| `SharedReference` | One reserved cell, one reference: the weak and hypercharge refreshes share it |
| `ColourReference` | Colour reads the payload: the ledger `12η` |
| `ReferenceAnchor` | What the lepton-doublet reference supplies elsewhere |
| `ReferenceStabilizer` | What the lepton-doublet reference leaves unbroken |
| `ReferenceDirections` | How many directions the electroweak actions can move the reference |
| `RegulatoryMaximin` | Equal regulatory gain from maximin, and the count 23 from the measured coupling |
| `ReferenceRestoration` | Three closures for the scalar ledger |
| `ReferenceLink` | The scalar link carries the reference's charge |
| `ReferenceMasses` | What the reference gives the gauge bosons |
| `ReferenceEconomy` | Economy places the references; unbroken colour picks the lepton doublet |
| `PersistenceClosures` | Closures by persistence |
| `ReferenceAxis` | The reference singles out the lepton axis |
| `RequirementRows` | Which frame rows the electroweak refreshes cover |
| `RequirementComplement` | The rest of the requirement table: complement and per-channel routing |
| `TableConsequences` | What the derived requirement table gives end to end |
| `ReadoutScales` | Where each readout is matched |
| `RunningLinks` | Paper III's running coefficients come from Paper II |
| `MatterRunning` | Paper II's dynamics applied to Paper III's derived content |
| `HyperScope` | Which hypercharge scope the W mass allows |
| `PreparationSelection` | The uniform preparation as an instance of law selection |
| `ScalePairing` | Which electric coupling the colour formula pairs with `α_s(M_Z)` |
| `StableReadout` | Why the colour formula pairs `α(0)` with `α_s(M_Z)` |
| `RegulatoryLabels` | The 23 regulatory labels are the coordinates of a link hop |
| `VevCorrections` | What the Fermi window says about the VEV corrections |
| `NeutralCurrent` | The photon and Z couplings from the reference's mass form |
| `RepairBudget` | The scalar budget from one exact repair of the reference |
| `BudgetReadout` | What the scalar budget reads from a repair |
| `NoiseShare` | Why the VEV's noise divisor is `3`, not `4` |
| `VacuumModulus` | θ = 0 is unique under the modulus too, once the trivial sector counts |
| `WallParityExchange` | θ̄ = θ from the wall exchange that is a symmetry |
| `ChannelOccupancy` | The sixteen channels are one observed generation, with no slot to spare |
| `ReflectionCharge` | The reflection charge rate `c` |
| `VevReadout` | The VEV corrections as one exact repair, read out once |
| `VevEvent` | The VEV is read from an event, and events happen only on spatial hops |
| `ReferenceWalkParity` | Compatibility names: the general dynamics proofs now live in Paper II. |
| `CarrierReadoutOrbits` | Classify basis-preparation weights invariant under the actual weak flip |
| `WeightedReadoutResponse` | The event/response map for supplied nonnegative preparation or work weights. |
| `GaugeReadoutWeights` | Response indices for every type-invariant incoherent basis preparation. |
| `LinkPreparation` | Stationary diagonal preparation under inter-type transfer. The generator, |
| `TypedRepairWork` | Price supplied type-dependent integer repairs using the actual comparison |
| `PrimitiveReadoutSymmetry` | A paired carrier-reflection action tests the six-type preparation freedom. |
| `CoherentComparisonRepair` | Compatibility names: the general dynamics proofs now live in Paper II. |
| `ControllerHamiltonian` | Compatibility names: the general dynamics proofs now live in Paper II. |
| `ReferenceMaintenance` | Compatibility names; generic reversible tasks now live in Paper II. |
| `ReferenceMaintenanceLedger` | Executable conditional ledgers and a partition countermodel |
| `SectorCapabilities` | Capabilities of the actual carrier operations |
