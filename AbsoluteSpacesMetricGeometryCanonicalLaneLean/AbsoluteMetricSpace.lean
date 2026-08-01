import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure AbsoluteMetricSpacePackage where
  carrier : Type u
  distance : carrier → carrier → ℝ
  positivity : ∀ x y, distance x y ≥ 0
  positivity_zero_iff : ∀ x y, distance x y = 0 ↔ x = y
  symmetry : ∀ x y, distance x y = distance y x
  triangle_inequality : ∀ x y z, distance x z ≤ distance x y + distance y z
  complete : Prop

structure AbsoluteMetricSpaceEvidence (M : AbsoluteMetricSpacePackage) where
  positivityClosed : ∀ x y, M.positivity x y
  positivity_zero_iffClosed : ∀ x y, M.positivity_zero_iff x y
  symmetryClosed : ∀ x y, M.symmetry x y
  triangle_inequalityClosed : ∀ x y z, M.triangle_inequality x y z
  completeClosed : M.complete

def AbsoluteMetricSpaceClosed (M : AbsoluteMetricSpacePackage) : Prop :=
  (∀ x y, M.positivity x y) ∧
  (∀ x y, M.positivity_zero_iff x y) ∧
  (∀ x y, M.symmetry x y) ∧
  (∀ x y z, M.triangle_inequality x y z) ∧
  M.complete

theorem absolute_metric_space_closed_from_evidence
    (M : AbsoluteMetricSpacePackage) (E : AbsoluteMetricSpaceEvidence M) :
    AbsoluteMetricSpaceClosed M := by
  exact And.intro E.positivityClosed
    (And.intro E.positivity_zero_iffClosed
      (And.intro E.symmetryClosed
        (And.intro E.triangle_inequalityClosed E.completeClosed)))

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse