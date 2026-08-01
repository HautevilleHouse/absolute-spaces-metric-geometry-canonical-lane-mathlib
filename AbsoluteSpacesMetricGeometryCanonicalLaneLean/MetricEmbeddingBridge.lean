import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure MetricEmbeddingPackage (A B : AbsoluteSpacePackage) where
  embedding : A.space → B.space
  isIsometric : ∀ x y, B.metric (embedding x) (embedding y) = A.metric x y
  embeddingInjective : Function.Injective embedding

structure MetricEmbeddingEvidence {A B : AbsoluteSpacePackage} (M : MetricEmbeddingPackage A B) where
  isIsometricClosed : M.isIsometric
  embeddingInjectiveClosed : M.embeddingInjective

def MetricEmbeddingClosed {A B : AbsoluteSpacePackage} (M : MetricEmbeddingPackage A B) : Prop :=
  M.isIsometric ∧ M.embeddingInjective

theorem metric_embedding_closed_from_evidence {A B : AbsoluteSpacePackage} (M : MetricEmbeddingPackage A B) (E : MetricEmbeddingEvidence M) : MetricEmbeddingClosed M := by
  exact And.intro E.isIsometricClosed E.embeddingInjectiveClosed

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse