import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbsoluteSpacesMetricGeometryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure CompletionPackage (A : AbsoluteAdmittedObject) where
  completionExists : Prop
  completionUnique : Prop
  isometricEmbedding : Prop

def CompletionClosed {A : AbsoluteAdmittedObject} (C : CompletionPackage A) : Prop :=
  C.completionExists ∧ C.completionUnique ∧ C.isometricEmbedding

structure CompletionEvidence {A : AbsoluteAdmittedObject} (C : CompletionPackage A) where
  completionExistsClosed : C.completionExists
  completionUniqueClosed : C.completionUnique
  isometricEmbeddingClosed : C.isometricEmbedding

theorem completion_closed_from_evidence {A : AbsoluteAdmittedObject} (C : CompletionPackage A)
    (E : CompletionEvidence C) : CompletionClosed C := by
  exact And.intro E.completionExistsClosed
    (And.intro E.completionUniqueClosed E.isometricEmbeddingClosed)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse