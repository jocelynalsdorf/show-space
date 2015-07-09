FactoryGirl.define do


 factory :user do
  	name('bob')
    sequence(:email) {|n| "test#{n}@example.com" }
    password('12345678')
    
  end

factory(:post) do
    title('fake post')
    link('www.fake.com')
    description('Some dumb text')
  end



  factory(:comment) do
  	content('this sucks')
  end  
end