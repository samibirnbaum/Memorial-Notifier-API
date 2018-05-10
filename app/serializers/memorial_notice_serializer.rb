class MemorialNoticeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :date_of_death, :after_nightfall, :spouse, :child1, :child2, :child3, 
              :child4, :child5, :child6, :child7, :child8, :child9, :child10, :grandchild1, :grandchild2, :grandchild3,
              :grandchild4, :grandchild5, :grandchild6, :grandchild7, :grandchild8, :grandchild9, :grandchild10

  has_one :user
  
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :email
  end
end
