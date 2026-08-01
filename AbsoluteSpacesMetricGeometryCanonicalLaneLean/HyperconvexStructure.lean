import canonicalLaneMathlib.AdmissibleClass
import AbsoluteSpacesMetricGeometryCanonicalLaneLean.AbsoluteSpaceFoundation

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure HyperconvexPackage {P : AbsoluteSpaceFoundationPackage} where
  hyperconvexProperty : Prop
  ballIntersectionNonempty : Prop
  extendsToAbsoluteSpace : Prop

structure HyperconvexEvidence {P : AbsoluteSpaceFoundationPackage} (H : HyperconvexPackage P) where
  hyperconvexPropertyClosed : H.hyperconvexProperty
  ballIntersectionNonemptyClosed : H.ballIntersectionNonempty
  extendsToAbsoluteSpaceClosed : H.extendsToAbsoluteSpace

def HyperconvexClosed {P : AbsoluteSpaceFoundationPackage} (H : HyperconvexPackage P) : Prop :=
  H.hyperconvexProperty ∧ H.ballIntersectionNonempty ∧ H.extendsToAbsoluteSpace

theorem hyperconvex_closed_from_evidence
    {P : AbsoluteSpaceFoundationPackage} (H : HyperconvexPackage P)
    (E : HyperconvexEvidence H) : HyperconvexClosed H := by
  exact And.intro E.hyperconvexPropertyClosed
    (And.intro E.ballIntersectionNonemptyClosed E.extendsToAbsoluteSpaceClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse