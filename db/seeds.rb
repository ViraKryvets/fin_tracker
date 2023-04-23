
require "faker"

200.times do 
 Operation.create(
    amount: Faker::Number.within(range: 50..5000),
    odate: Faker::Date.between(from: '2022-08-01', to: '2023-02-13'),
    description: Faker::Commerce.product_name,
    otype: 0,
    category_id: Faker::Number.within(range: 1..13)
)
end

10.times do 
 Operation.create(
    amount: 30000,
    odate: Faker::Date.between(from: '2022-08-01', to: '2023-02-13'),
    description: "Salary",
    otype: 1,
    category_id: 14
)
end

    