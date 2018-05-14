class MemorialNotice < ApplicationRecord
    #@first_name
    #@last_name 
    #@date_of_death 
    #@after_nightfall 
    #@spouse 
    #@child1 
    #@child2 
    #@child3
    #@child4 
    #@child5 
    #@child6 
    #@child7 
    #@child8 
    #@child9
    #@child10 
    #@grandchild1
    #@grandchild2 
    #@grandchild3 
    #@grandchild4 
    #@grandchild5 
    #@grandchild6 
    #@grandchild7 
    #@grandchild8 
    #@grandchild9
    #@grandchild10
    #@user_id

    before_create :capitalize_first_and_last_name

    belongs_to :user

    validates :first_name, :last_name, :date_of_death, :user_id, presence: true
    validates_inclusion_of :after_nightfall,:in => [true, false]
    #attributes not assigned automatically default to nil


    private
    def capitalize_first_and_last_name
        self.first_name.capitalize!
        self.last_name.capitalize!
    end
end
