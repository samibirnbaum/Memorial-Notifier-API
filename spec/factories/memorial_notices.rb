FactoryBot.define do
  factory :memorial_notice do
    first_name "Joe"
    last_name "Smith"
    date_of_death "24/04/2016"
    after_nightfall false
    spouse "Jenny Smith"
    child1 "Max Smith"
    child2 "Charlie Smith"
    child3 nil
    child4 nil
    child5 nil
    child6 nil
    child7 nil
    child8 nil
    child9 nil
    child10 nil
    grandchild1 "Kelly Smith"
    grandchild2 nil
    grandchild3 nil
    grandchild4 nil
    grandchild5 nil
    grandchild6 nil
    grandchild7 nil
    grandchild8 nil
    grandchild9 nil
    grandchild10 nil
    user #this will be the user from the user factory - sami@sami.com - password
  end
end
