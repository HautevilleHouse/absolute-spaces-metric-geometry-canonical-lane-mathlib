import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure AbsoluteSpacePackage where
  space : Type u
  metric : space → space → ℝ
  metricPositiveDefinite : ∀ x y, metric x y = 0 ↔ x = y
  metricSymmetric : ∀ x y, metric x y = metric y x
  metricTriangle : ∀ x y z, metric x z ≤ metric x y + metric y z
  absoluteValuedField : Type v
  absoluteValue : absoluteValuedField → ℝ
  compatibleWithMetric : Prop

structure AbsoluteSpaceEvidence (A : AbsoluteSpacePackage) where
  metricPositiveDefiniteClosed : A.metricPositiveDefinite
  metricSymmetricClosed : A.metricSymmetric
  metricTriangleClosed : A.metricTriangle
  compatibleWithMetricClosed : A.compatibleWithMetric

def AbsoluteSpaceClosed (A : AbsoluteSpacePackage) : Prop :=
  A.metricPositiveDefinite ∧ A.metricSymmetric ∧ A.metricTriangle ∧ A.compatibleWithMetric

theorem absolute_space_closed_from_evidence (A : AbsoluteSpacePackage) (E : AbsoluteSpaceEvidence A) : AbsoluteSpaceClosed A := by
  exact And.intro E.metricPositiveDefiniteClosed (And.intro E.metricSymmetricClosed (And.intro E.metricTriangleClosed E.compatibleWithMetricClosed))

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse