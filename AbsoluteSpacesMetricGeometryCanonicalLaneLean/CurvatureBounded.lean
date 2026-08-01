import AbsoluteSpacesMetricGeometryCanonicalLaneLean.MetricSpaceStructure

/-!
# Curvature Bounded Package
-/

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure CurvatureBoundedPackage {M : MetricSpacePackage} where
  upperCurvatureBound : Prop
  lowerCurvatureBound : Prop
  comparisonInequality : Prop

structure CurvatureBoundedEvidence {M : MetricSpacePackage} (C : CurvatureBoundedPackage M) where
  upperCurvatureBoundClosed : C.upperCurvatureBound
  lowerCurvatureBoundClosed : C.lowerCurvatureBound
  comparisonInequalityClosed : C.comparisonInequality

def CurvatureBoundedClosed {M : MetricSpacePackage} (C : CurvatureBoundedPackage M) : Prop :=
  C.upperCurvatureBound ∧ C.lowerCurvatureBound ∧ C.comparisonInequality

theorem curvature_bounded_closed_from_evidence {M : MetricSpacePackage} (C : CurvatureBoundedPackage M) (E : CurvatureBoundedEvidence C) :
    CurvatureBoundedClosed C := by
  exact And.intro E.upperCurvatureBoundClosed (And.intro E.lowerCurvatureBoundClosed E.comparisonInequalityClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse