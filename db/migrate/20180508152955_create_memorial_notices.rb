class CreateMemorialNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :memorial_notices do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_death
      t.boolean :after_nightfall
      t.string :spouse
      t.string :child1
      t.string :child2
      t.string :child3
      t.string :child4
      t.string :child5
      t.string :child6
      t.string :child7
      t.string :child8
      t.string :child9
      t.string :child10
      t.string :grandchild1
      t.string :grandchild2
      t.string :grandchild3
      t.string :grandchild4
      t.string :grandchild5
      t.string :grandchild6
      t.string :grandchild7
      t.string :grandchild8
      t.string :grandchild9
      t.string :grandchild10
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
