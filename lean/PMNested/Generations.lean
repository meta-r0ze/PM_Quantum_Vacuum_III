import PMAction.CarrierCost

/-!
# Three generations as the pairs of distinct glue classes

A generation's sixteen channels are two domain-wall sectors of eight carriers each. Paper II's
packet of two glue classes has sixteen carriers (`PMAction.CarrierCost.packet_card`).

* `same_class_loses`: if both sectors use the same class, the packet's carrier vectors are not
  injective: a left carrier and a right carrier coincide as substrate vectors, so a distinction is
  lost (Conservation). `PMAction.CarrierCost.packet_vector_injective` shows distinct classes keep it.
  A generation therefore needs two distinct nontrivial classes.
* The update carries no sector label (`SectorExchange`), so swapping which class holds the
  left-handed sector gives the same generation: generations are unordered pairs.
* `three_pairs`: there are exactly three unordered pairs of distinct classes among the three
  nontrivial D₄ glue classes. No fourth pair exists.

So the three-generation count and the exclusion of a fourth follow from the carrier classes, the
injectivity required by Conservation, and the sector-exchange premise already used for strong CP.
-/

namespace PMNested.Generations
open PMAction PMAction.CarrierEvents PMAction.CarrierCost

theorem same_class_loses (a : Fin 3) :
    ¬ Function.Injective (@packetVector a a) := by
  intro h
  have : Nonempty (Carrier a) := Fintype.card_pos_iff.mp (by rw [carrier_card]; norm_num)
  obtain ⟨v⟩ := (inferInstance : Nonempty (Carrier a))
  have := h (a₁ := Sum.inl v) (a₂ := Sum.inr v) rfl
  cases this

theorem three_pairs :
    (Finset.univ.filter fun p : Fin 3 × Fin 3 => p.1 < p.2).card = 3 := by decide

theorem packets_sixteen (a b : Fin 3) : Fintype.card (Packet a b) = 16 := packet_card a b

end PMNested.Generations
