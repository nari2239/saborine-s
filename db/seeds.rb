user = User.create(
  nickname: "sabotaro",
  email: 'user@test.com',
  password: 'testuser1'
)

20.times do
  Record.create(
    date: Faker::Date.between(from: '2021-01-01', to: '2021-03-31'),
    time: Faker::Number.between(from: 0, to: 100),
    skip: Faker::Lorem.characters(number: 100),
    to_do: Faker::Lorem.characters(number: 100),
    user_id: user.id
  )
end