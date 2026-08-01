import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbsoluteSpacesMetricGeometryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure MetricGeometryPackage (A : AbsoluteAdmittedObject) where
  topologyCompatible : Prop
  boundedness : Prop
  completeness : Prop

def MetricGeometryClosed {A : AbsoluteAdmittedObject} (M : MetricGeometryPackage A) : Prop :=
  M.topologyCompatible ∧ M.boundedness ∧ M.completeness

structure MetricGeometryEvidence {A : AbsoluteAdmittedObject} (M : MetricGeometryPackage A) where
  topologyCompatibleClosed : M.topologyCompatible
  boundednessClosed : M.boundedness
  completenessClosed : M.completeness

theorem metric_geometry_closed_from_evidence {A : AbsoluteAdmittedObject} (M : MetricGeometryPackage A)
    (E : MetricGeometryEvidence M) : MetricGeometryClosed M := by
  exact And.intro E.topologyCompatibleClosed
    (And.intro E.boundednessClosed E.completenessClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse