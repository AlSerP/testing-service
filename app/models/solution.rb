class Solution < ApplicationRecord
  belongs_to :test
  has_many :solution_questions

  # Завершен ли тест
  def completed?
    test.questions.count == solution_questions.count
  end

  def count_score
    counter = 0
    solution_questions.each {|solution| counter += solution.is_correct.to_i } 
  end
end
