import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbsoluteSpacesMetricGeometryCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.AbsoluteSpacesMetricGeometryCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse