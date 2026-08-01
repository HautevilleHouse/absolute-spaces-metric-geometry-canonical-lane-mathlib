import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure UltrametricPackage (A : AbsoluteSpacePackage) where
  strongTriangle : ∀ x y z, A.metric x z ≤ max (A.metric x y) (A.metric y z)
  strongTriangleClosed : strongTriangle

def UltrametricClosed (A : AbsoluteSpacePackage) : Prop :=
  ∀ x y z, A.metric x z ≤ max (A.metric x y) (A.metric y z)

theorem ultrametric_closed (A : AbsoluteSpacePackage) (U : UltrametricPackage A) : UltrametricClosed A := by
  intro x y z
  exact U.strongTriangleClosed x y z

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse