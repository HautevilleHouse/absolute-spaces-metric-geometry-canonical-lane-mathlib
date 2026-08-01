import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryCanonicalLaneLean

structure IsometryGroupStructure (A : AbsoluteSpacePackage) where
  group : Type u
  groupOperation : group → group → group
  groupAssoc : ∀ a b c, groupOperation (groupOperation a b) c = groupOperation a (groupOperation b c)
  identity : group
  inverse : group → group
  action : group → A.space → A.space
  isIsometry : ∀ g, ∀ x y, A.metric (action g x) (action g y) = A.metric x y
  groupAssocClosed : groupAssoc
  isIsometryClosed : isIsometry

def IsometryGroupClosed (A : AbsoluteSpacePackage) (I : IsometryGroupStructure A) : Prop :=
  I.groupAssoc ∧ I.isIsometry

theorem isometry_group_closed (A : AbsoluteSpacePackage) (I : IsometryGroupStructure A) : IsometryGroupClosed A I := by
  exact And.intro I.groupAssocClosed I.isIsometryClosed

end AbsoluteSpacesMetricGeometryCanonicalLaneLean
end HautevilleHouse