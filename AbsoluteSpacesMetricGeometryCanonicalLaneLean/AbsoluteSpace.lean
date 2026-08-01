import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure AbsoluteSpace where
  carrier : Type u
  dist : carrier → carrier → ℝ
  dist_nonneg : ∀ x y, 0 ≤ dist x y
  dist_eq_zero : ∀ x y, dist x y = 0 ↔ x = y
  dist_symm : ∀ x y, dist x y = dist y x
  dist_triangle : ∀ x y z, dist x z ≤ dist x y + dist y z

structure CompleteMetricSpace (X : AbsoluteSpace) : Prop where
  complete : ∀ (f : ℕ → X.carrier), Cauchy f → ∃ x, limit f x

structure BoundedMetricSpace (X : AbsoluteSpace) : Prop where
  bounded : ∃ R, ∀ x y, X.dist x y ≤ R

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse