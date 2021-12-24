# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: 'test_user1',
  email: 'test_mail1@example.com',
  password: 'password',
  password_confirmation: 'password',
  birth_day: '2000-05-25',
  file_url: 'https://e-code.s3.ap-northeast-1.amazonaws.com/test_image1.jpg',
)
User.create!(
  name: 'test_user2',
  email: 'test_mail2@example.com',
  password: 'password',
  password_confirmation: 'password',
  birth_day: '2000-08-10',
  file_url: 'https://e-code.s3.ap-northeast-1.amazonaws.com/test_image2.jpg',
)

test_user1 = User.find(1)
episode1 =
  Episode.create!(
    content: 'これはテスト用のエピソードです(1)',
    user: test_user1,
  )

episode2 =
  Episode.create!(
    content: 'これはテスト用のエピソードです(2)',
    user: test_user1,
  )

test_user2 = User.find(2)
episode3 =
  Episode.create!(
    content: 'これはテスト用のエピソードです(3)',
    user: test_user2,
  )

episode4 =
  Episode.create!(
    content: 'これはテスト用のエピソードです(4)',
    user: test_user2,
  )
