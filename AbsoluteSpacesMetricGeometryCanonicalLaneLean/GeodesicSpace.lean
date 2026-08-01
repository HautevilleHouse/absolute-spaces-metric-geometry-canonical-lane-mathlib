import AbsoluteSpacesMetricGeometryCanonicalLaneLean.LengthSpace

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure GeodesicSpacePackage {M : MetricSpacePackage}
    {L : LengthSpacePackage M} where
  geodesicExistence : Prop
  uniqueGeodesics : Prop
  convexity : Prop
  nonpositiveCurvature : Prop

structure GeodesicSpaceEvidence {M : MetricSpacePackage}
    {L : LengthSpacePackage M} (G : GeodesicSpacePackage L) where
  geodesicExistenceClosed : G.geodesicExistence
  uniqueGeodesicsClosed : G.uniqueGeodesics
  convexityClosed : G.convexity
  nonpositiveCurvatureClosed : G.nonpositiveCurvature

def GeodesicSpaceClosed {M : MetricSpacePackage}
    {L : LengthSpacePackage M} (G : GeodesicSpacePackage L) : Prop :=
  G.geodesicExistence ∧ G.uniqueGeodesics ∧
  G.convexity ∧ G.nonpositiveCurvature

theorem geodesic_space_closed_from_evidence
    {M : MetricSpacePackage} {L : LengthSpacePackage M}
    (G : GeodesicSpacePackage L) (E : GeodesicSpaceEvidence G) :
    GeodesicSpaceClosed G := by
  exact And.intro E.geodesicExistenceClosed
    (And.intro E.uniqueGeodesicsClosed
      (And.intro E.convexityClosed
        E.nonpositiveCurvatureClosed))

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse