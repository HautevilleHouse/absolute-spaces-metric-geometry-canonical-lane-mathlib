import Mathlib.Topology.Basic

/-!
# Absolute Space Package

This module defines the formal objects for an absolute space: a metric space with
additional properties such as completeness, geodesicness, or curvature bounds.
-/

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure AbsoluteSpacePackage where
  carrier : Type u
  topology : TopologicalSpace carrier
  metric : Type v
  complete : Prop
  geodesic : Prop
  curvatureBounded : Prop
  metricSmooth : Prop

structure AbsoluteSpaceEvidence (G : AbsoluteSpacePackage) where
  completeClosed : G.complete
  geodesicClosed : G.geodesic
  curvatureBoundedClosed : G.curvatureBounded
  metricSmoothClosed : G.metricSmooth

def AbsoluteSpaceClosed (G : AbsoluteSpacePackage) : Prop :=
  G.complete ∧ G.geodesic ∧ G.curvatureBounded ∧ G.metricSmooth

theorem absolute_space_closed_from_evidence
    (G : AbsoluteSpacePackage) (E : AbsoluteSpaceEvidence G) :
    AbsoluteSpaceClosed G := by
  exact And.intro E.completeClosed
    (And.intro E.geodesicClosed
      (And.intro E.curvatureBoundedClosed E.metricSmoothClosed))

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse