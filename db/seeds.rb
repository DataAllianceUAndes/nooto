# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    role: 'student'
  )
end

5.times do
  Course.create(
    title: Faker::Educator.course_name,
    user_id: User.all.sample.id
  )
end

# each user can enroll once in each course
# each course can have multiple students
# each student can enroll in multiple courses
User.all.each do |user|
  Course.all.each do |course|
    Enrollment.create(
      user_id: user.id,
      course_id: course.id
    )
  end
end

10.times do
  Classnote.create(
    title: Faker::File.file_name,
    user_id: User.all.sample.id,
    course_id: Course.all.sample.id)
end
