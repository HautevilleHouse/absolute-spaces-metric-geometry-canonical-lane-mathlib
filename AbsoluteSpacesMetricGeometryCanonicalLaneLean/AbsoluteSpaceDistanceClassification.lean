import absoluteSpacesMetricGeometryCanonicalLaneLean.GeodesicCompletion

/-!
# Absolute Space Distance Classification Package

This module classifies distances in absolute spaces, analogous to endpoint classification.
-/

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure DistanceClassificationPackage {G : AbsoluteSpacePackage}
    {M : AbsoluteSpaceMetricCore G} {C : GeodesicCompletionPackage G M} where
  distanceSet : Set ℝ
  distanceSetBounded : Prop
  diameterFinite : Prop
  classificationComplete : Prop

structure DistanceClassificationEvidence {G : AbsoluteSpacePackage}
    {M : AbsoluteSpaceMetricCore G} {C : GeodesicCompletionPackage G M}
    (D : DistanceClassificationPackage G M C) where
  distanceSetBoundedClosed : D.distanceSetBounded
  diameterFiniteClosed : D.diameterFinite
  classificationCompleteClosed : D.classificationComplete

def DistanceClassificationClosed {G : AbsoluteSpacePackage}
    {M : AbsoluteSpaceMetricCore G} {C : GeodesicCompletionPackage G M}
    (D : DistanceClassificationPackage G M C) : Prop :=
  D.distanceSetBounded ∧ D.diameterFinite ∧ D.classificationComplete

theorem distance_classification_closed_from_evidence
    {G : AbsoluteSpacePackage} {M : AbsoluteSpaceMetricCore G}
    {C : GeodesicCompletionPackage G M} (D : DistanceClassificationPackage G M C)
    (E : DistanceClassificationEvidence D) : DistanceClassificationClosed D := by
  exact And.intro E.distanceSetBoundedClosed
    (And.intro E.diameterFiniteClosed E.classificationCompleteClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse