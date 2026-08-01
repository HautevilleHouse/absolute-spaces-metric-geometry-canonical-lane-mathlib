import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbsoluteSpacesMetricGeometryCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.AbsoluteSpacesMetricGeometryCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.AbsoluteSpacesMetricGeometryCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

def ConstrainedAbsoluteSpacesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_absolute_spaces_endgame (A : AdmissibleClass) :
    ConstrainedAbsoluteSpacesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse