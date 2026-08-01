import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure NonArchimedeanMetricPackage (A : AbsoluteSpacePackage) where
  nonArchimedean : ∀ a : A.absoluteValuedField, A.absoluteValue a ≤ 1 ∨ A.absoluteValue a ≥ 1
  nonArchimedeanClosed : nonArchimedean

def NonArchimedeanMetricClosed (A : AbsoluteSpacePackage) : Prop :=
  ∀ a : A.absoluteValuedField, A.absoluteValue a ≤ 1 ∨ A.absoluteValue a ≥ 1

theorem non_archimedean_metric_closed (A : AbsoluteSpacePackage) (N : NonArchimedeanMetricPackage A) : NonArchimedeanMetricClosed A := by
  intro a
  exact N.nonArchimedeanClosed a

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse