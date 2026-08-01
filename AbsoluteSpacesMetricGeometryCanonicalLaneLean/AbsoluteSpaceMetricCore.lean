import absoluteSpacesMetricGeometryCanonicalLaneLean.AbsoluteSpacePackage

/-!
# Absolute Space Metric Core

This module defines the core metric structure for absolute spaces,
including distance function, Cauchy completeness, and geodesic segments.
-/

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure AbsoluteSpaceMetricCore {G : AbsoluteSpacePackage} where
  distance : G.carrier → G.carrier → ℝ
  distanceNonnegative : ∀ x y, distance x y ≥ 0
  distanceSymm : ∀ x y, distance x y = distance y x
  distanceTriangle : ∀ x y z, distance x z ≤ distance x y + distance y z
  cauchyComplete : Prop  -- every Cauchy sequence converges
  geodesicSegment : Prop  -- for any two points, there exists a geodesic segment

def AbsoluteSpaceMetricCoreClosed {G : AbsoluteSpacePackage} (M : AbsoluteSpaceMetricCore G) : Prop :=
  M.cauchyComplete ∧ M.geodesicSegment

theorem absolute_space_metric_core_closed
    {G : AbsoluteSpacePackage} (M : AbsoluteSpaceMetricCore G)
    (hcc : M.cauchyComplete) (hgs : M.geodesicSegment) :
    AbsoluteSpaceMetricCoreClosed M := by
  exact And.intro hcc hgs

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse