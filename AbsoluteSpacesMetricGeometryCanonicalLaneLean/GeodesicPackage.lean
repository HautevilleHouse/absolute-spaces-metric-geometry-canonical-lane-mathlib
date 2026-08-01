import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbsoluteSpacesMetricGeometryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure GeodesicPackage (A : AbsoluteAdmittedObject) where
  existenceMinimalGeodesic : Prop
  uniqueGeodesic : Prop
  convexity : Prop

def GeodesicClosed {A : AbsoluteAdmittedObject} (G : GeodesicPackage A) : Prop :=
  G.existenceMinimalGeodesic ∧ G.uniqueGeodesic ∧ G.convexity

structure GeodesicEvidence {A : AbsoluteAdmittedObject} (G : GeodesicPackage A) where
  existenceMinimalGeodesicClosed : G.existenceMinimalGeodesic
  uniqueGeodesicClosed : G.uniqueGeodesic
  convexityClosed : G.convexity

theorem geodesic_closed_from_evidence {A : AbsoluteAdmittedObject} (G : GeodesicPackage A)
    (E : GeodesicEvidence G) : GeodesicClosed G := by
  exact And.intro E.existenceMinimalGeodesicClosed
    (And.intro E.uniqueGeodesicClosed E.convexityClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse