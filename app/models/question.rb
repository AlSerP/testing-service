class Question < ApplicationRecord
  has_many :answers

  def correct_answers
    answers.where(is_correct: True)
  end
end
