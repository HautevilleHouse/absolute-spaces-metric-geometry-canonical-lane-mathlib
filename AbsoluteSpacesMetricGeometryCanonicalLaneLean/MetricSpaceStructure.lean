import AbsoluteSpacesMetricGeometryCanonicalLaneLean.AdmissibleClass
import Mathlib.Topology.MetricSpace.Basic

/-!
# Metric Space Structure Package
-/

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure MetricSpacePackage where
  space : Type u
  metric : MetricSpace space
  geodesic : Prop
  lengthMetric : Prop
  properness : Prop

structure MetricSpaceEvidence (M : MetricSpacePackage) where
  geodesicClosed : M.geodesic
  lengthMetricClosed : M.lengthMetric
  propernessClosed : M.properness

def MetricSpaceClosed (M : MetricSpacePackage) : Prop :=
  M.geodesic ∧ M.lengthMetric ∧ M.properness

theorem metric_space_closed_from_evidence (M : MetricSpacePackage) (E : MetricSpaceEvidence M) :
    MetricSpaceClosed M := by
  exact And.intro E.geodesicClosed (And.intro E.lengthMetricClosed E.propernessClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse