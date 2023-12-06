# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'

def load_seed(name)
  JSON.parse File.open(File.join(Rails.root, 'db', 'seeds', "#{name}.json")).read
end

tests_seeds = load_seed('tests')

tests_seeds.each do |test|
  Test.create!(
    id: test['id'],
    title: test['title']
  )
end

puts '== Tests seeding complete'


questions_seeds = load_seed('questions')

questions_seeds.each do |question|
  Question.create!(
    id: question['id'],
    test_id: question['test_id'],
    body: question['body']
  )
end

puts '== Questions seeding complete'


answers_seeds = load_seed('answers')

answers_seeds.each do |answers|
  Answer.create!(
    id: answers['id'],
    question_id: answers['question_id'],
    body: answers['body'],
    is_correct: answers['is_correct']
  )
end

puts '== Answers seeding complete'
