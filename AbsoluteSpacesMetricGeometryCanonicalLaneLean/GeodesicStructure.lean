import AbsoluteSpacesMetricGeometryCanonicalLaneLean.MetricSpaceStructure

/-!
# Geodesic Structure Package
-/

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure GeodesicStructurePackage {M : MetricSpacePackage} where
  existenceOfGeodesics : Prop
  uniquenessOfGeodesics : Prop
  midpointProperty : Prop

structure GeodesicStructureEvidence {M : MetricSpacePackage} (G : GeodesicStructurePackage M) where
  existenceOfGeodesicsClosed : G.existenceOfGeodesics
  uniquenessOfGeodesicsClosed : G.uniquenessOfGeodesics
  midpointPropertyClosed : G.midpointProperty

def GeodesicStructureClosed {M : MetricSpacePackage} (G : GeodesicStructurePackage M) : Prop :=
  G.existenceOfGeodesics ∧ G.uniquenessOfGeodesics ∧ G.midpointProperty

theorem geodesic_structure_closed_from_evidence {M : MetricSpacePackage} (G : GeodesicStructurePackage M) (E : GeodesicStructureEvidence G) :
    GeodesicStructureClosed G := by
  exact And.intro E.existenceOfGeodesicsClosed (And.intro E.uniquenessOfGeodesicsClosed E.midpointPropertyClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse