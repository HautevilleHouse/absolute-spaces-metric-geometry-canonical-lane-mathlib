import absoluteSpacesMetricGeometryCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

def ConstrainedAbsoluteSpaceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_absolute_space_endgame (A : AdmissibleClass) :
    ConstrainedAbsoluteSpaceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse