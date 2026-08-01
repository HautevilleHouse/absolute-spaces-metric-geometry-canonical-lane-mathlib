import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure AbsoluteSpaceFoundationPackage where
  space : Type
  metric : MetricSpace space
  isAbsoluteSpace : Prop
  injectiveProperty : Prop
  geodesicConvex : Prop

structure AbsoluteSpaceFoundationEvidence (P : AbsoluteSpaceFoundationPackage) where
  isAbsoluteSpaceClosed : P.isAbsoluteSpace
  injectivePropertyClosed : P.injectiveProperty
  geodesicConvexClosed : P.geodesicConvex

def AbsoluteSpaceFoundationClosed (P : AbsoluteSpaceFoundationPackage) : Prop :=
  P.isAbsoluteSpace ∧ P.injectiveProperty ∧ P.geodesicConvex

theorem absolute_space_foundation_closed_from_evidence
    (P : AbsoluteSpaceFoundationPackage) (E : AbsoluteSpaceFoundationEvidence P) :
    AbsoluteSpaceFoundationClosed P := by
  exact And.intro E.isAbsoluteSpaceClosed
    (And.intro E.injectivePropertyClosed E.geodesicConvexClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse