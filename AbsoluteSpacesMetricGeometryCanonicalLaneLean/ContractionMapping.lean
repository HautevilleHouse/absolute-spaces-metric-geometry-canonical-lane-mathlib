import Mathlib.Topology.MetricSpace.Banach
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure ContractionMapping (X : AbsoluteSpace) where
  f : X.carrier → X.carrier
  lipschitz : ∃ k < 1, ∀ x y, dist (f x) (f y) ≤ k * dist x y

theorem banach_fixed_point {X : AbsoluteSpace}
    (hX : CompleteMetricSpace ⟨X, X.dist, X.dist_nonneg, X.dist_eq_zero, X.dist_symm, X.dist_triangle⟩)
    [CompleteSpace X.carrier]
    (C : ContractionMapping X) :
    ∃! x : X.carrier, C.f x = x := by
  classical
  rcases C.lipschitz with ⟨k, hk1, hk⟩
  let K := max k 0
  have hK0 : 0 ≤ K := le_max_right k 0
  have hK1 : K < 1 := by
    exact max_lt_iff.2 ⟨hk1, by norm_num⟩
  have hfL : LipschitzWith K C.f := by
    refine ⟨hK0, ?_⟩
    intro x y
    calc
      dist (C.f x) (C.f y) ≤ k * dist x y := hk x y
      _ ≤ K * dist x y := by
        exact mul_le_mul_of_nonneg_right (le_max_left k 0) (dist_nonneg _ _)
  obtain ⟨x, hx⟩ := exists_fixed_point (α := X.carrier) hK1 hfL
  refine ⟨x, hx, ?_⟩
  intro y hy
  have hxy : dist x y = dist (C.f x) (C.f y) := by
    rw [hx, hy]
  have hle : dist x y ≤ K * dist x y := by
    rw [hxy]
    exact hfL.2 x y
  by_contra hxy_ne
  have hdist_ne : dist x y ≠ 0 := by
    intro hd
    exact hxy_ne (dist_eq_zero.1 hd)
  have hpos : 0 < dist x y := lt_of_le_of_ne (dist_nonneg _ _) hdist_ne.symm
  have hlt : K * dist x y < dist x y := by
    rw [← one_mul (dist x y)]
    exact mul_lt_mul_of_pos_right hK1 hpos
  exact (lt_irrefl _) (lt_of_le_of_lt hle hlt)

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse