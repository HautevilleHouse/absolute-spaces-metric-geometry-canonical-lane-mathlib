import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

theorem contraction_mapping_closed (X : AbsoluteSpace) (h : CompleteMetricSpace X) (C : ContractionMapping X) :
    gateClosed (AdmissibleClass.mk (AbsoluteSpaceAdmittedObject.mk X carrier metric complete bounded conclusion) ?_ ?_ ?_) := by
  exact gate_from_admissible_class _

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse