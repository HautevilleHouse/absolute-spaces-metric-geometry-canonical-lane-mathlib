import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure AbsoluteSpace where
  carrier : Type
  metric : carrier → carrier → ℝ
  metricPositive : ∀ x y, metric x y ≥ 0
  metricIdent : ∀ x y, metric x y = 0 ↔ x = y
  metricSymm : ∀ x y, metric x y = metric y x
  metricTriangle : ∀ x y z, metric x z ≤ metric x y + metric y z

structure AbsoluteAdmittedObject where
  space : AbsoluteSpace
  complete : Prop
  geodesic : Prop
  conclusion : complete ∧ geodesic

structure AdmissibleClass where
  object : AbsoluteAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse