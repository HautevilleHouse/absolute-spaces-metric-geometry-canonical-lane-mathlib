import AbsoluteSpacesMetricGeometryCanonicalLaneLean.MetricSpace

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure LengthSpacePackage {M : MetricSpacePackage} where
  lengthMetricCoincidence : Prop
  rectifiableCurvesDense : Prop
  completenessFromLength : Prop
  geodesicConnectedness : Prop

structure LengthSpaceEvidence {M : MetricSpacePackage} (L : LengthSpacePackage M) where
  lengthMetricCoincidenceClosed : L.lengthMetricCoincidence
  rectifiableCurvesDenseClosed : L.rectifiableCurvesDense
  completenessFromLengthClosed : L.completenessFromLength
  geodesicConnectednessClosed : L.geodesicConnectedness

def LengthSpaceClosed {M : MetricSpacePackage} (L : LengthSpacePackage M) : Prop :=
  L.lengthMetricCoincidence ∧ L.rectifiableCurvesDense ∧
  L.completenessFromLength ∧ L.geodesicConnectedness

theorem length_space_closed_from_evidence
    {M : MetricSpacePackage} (L : LengthSpacePackage M)
    (E : LengthSpaceEvidence L) : LengthSpaceClosed L := by
  exact And.intro E.lengthMetricCoincidenceClosed
    (And.intro E.rectifiableCurvesDenseClosed
      (And.intro E.completenessFromLengthClosed
        E.geodesicConnectednessClosed))

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse