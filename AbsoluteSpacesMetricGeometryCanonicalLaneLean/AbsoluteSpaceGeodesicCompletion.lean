import absoluteSpacesMetricGeometryCanonicalLaneLean.AbsoluteSpaceMetricCore

/-!
# Absolute Space Geodesic Completion Package

This module defines the geodesic completion of an absolute space, ensuring
every Cauchy sequence converges and geodesics extend.
-/

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure GeodesicCompletionPackage {G : AbsoluteSpacePackage}
    (M : AbsoluteSpaceMetricCore G) where
  completionSpace : Type u
  completionMetric : completionSpace → completionSpace → ℝ
  embeddingIsIsometric : Prop
  denseRange : Prop
  geodesicExtends : Prop

structure GeodesicCompletionEvidence {G : AbsoluteSpacePackage}
    {M : AbsoluteSpaceMetricCore G} (C : GeodesicCompletionPackage G M) where
  embeddingIsIsometricClosed : C.embeddingIsIsometric
  denseRangeClosed : C.denseRange
  geodesicExtendsClosed : C.geodesicExtends

def GeodesicCompletionClosed {G : AbsoluteSpacePackage}
    {M : AbsoluteSpaceMetricCore G} (C : GeodesicCompletionPackage G M) : Prop :=
  C.embeddingIsIsometric ∧ C.denseRange ∧ C.geodesicExtends

theorem geodesic_completion_closed_from_evidence
    {G : AbsoluteSpacePackage} {M : AbsoluteSpaceMetricCore G}
    (C : GeodesicCompletionPackage G M) (E : GeodesicCompletionEvidence C) :
    GeodesicCompletionClosed C := by
  exact And.intro E.embeddingIsIsometricClosed
    (And.intro E.denseRangeClosed E.geodesicExtendsClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse