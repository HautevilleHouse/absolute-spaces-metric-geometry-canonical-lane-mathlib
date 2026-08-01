import canonicalLaneMathlib.AdmissibleClass
import AbsoluteSpacesMetricGeometryCanonicalLaneLean.AbsoluteSpaceFoundation

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure InjectiveEnvelopePackage {P : AbsoluteSpaceFoundationPackage} where
  envelopeSpace : Type
  envelopeMetric : MetricSpace envelopeSpace
  isAbsoluteEnvelope : Prop
  embeddingIsometric : Prop
  envelopeExtensionProperty : Prop

structure InjectiveEnvelopeEvidence {P : AbsoluteSpaceFoundationPackage}
    (E : InjectiveEnvelopePackage P) where
  isAbsoluteEnvelopeClosed : E.isAbsoluteEnvelope
  embeddingIsometricClosed : E.embeddingIsometric
  envelopeExtensionPropertyClosed : E.envelopeExtensionProperty

def InjectiveEnvelopeClosed {P : AbsoluteSpaceFoundationPackage}
    (E : InjectiveEnvelopePackage P) : Prop :=
  E.isAbsoluteEnvelope ∧ E.embeddingIsometric ∧ E.envelopeExtensionProperty

theorem injective_envelope_closed_from_evidence
    {P : AbsoluteSpaceFoundationPackage} (E : InjectiveEnvelopePackage P)
    (Ev : InjectiveEnvelopeEvidence E) : InjectiveEnvelopeClosed E := by
  exact And.intro Ev.isAbsoluteEnvelopeClosed
    (And.intro Ev.embeddingIsometricClosed Ev.envelopeExtensionPropertyClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse