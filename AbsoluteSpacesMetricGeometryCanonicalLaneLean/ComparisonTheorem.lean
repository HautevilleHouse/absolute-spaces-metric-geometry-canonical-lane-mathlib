import AbsoluteSpacesMetricGeometryCanonicalLaneLean.CurvatureBounded

/-!
# Comparison Theorem Package
-/

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure ComparisonTheoremPackage {M : MetricSpacePackage} {C : CurvatureBoundedPackage M} where
  triangleComparison : Prop
  angleMonotonicity : Prop
  rigidityCondition : Prop

structure ComparisonTheoremEvidence {M : MetricSpacePackage} {C : CurvatureBoundedPackage M} (T : ComparisonTheoremPackage C) where
  triangleComparisonClosed : T.triangleComparison
  angleMonotonicityClosed : T.angleMonotonicity
  rigidityConditionClosed : T.rigidityCondition

def ComparisonTheoremClosed {M : MetricSpacePackage} {C : CurvatureBoundedPackage M} (T : ComparisonTheoremPackage C) : Prop :=
  T.triangleComparison ∧ T.angleMonotonicity ∧ T.rigidityCondition

theorem comparison_theorem_closed_from_evidence {M : MetricSpacePackage} {C : CurvatureBoundedPackage M} (T : ComparisonTheoremPackage C) (E : ComparisonTheoremEvidence T) :
    ComparisonTheoremClosed T := by
  exact And.intro E.triangleComparisonClosed (And.intro E.angleMonotonicityClosed E.rigidityConditionClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse