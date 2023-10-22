class SolutionQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :solution

  has_many :answers

  # Проверка верности ответа на вопрос
  def correct?
    correct_answers = question.correct_answers
    return False unless correct_answers.count == answers.count
    
    is_correct = True
    answers.each { |answer| is_correct *= False unless correct_answers.include? answer }

    is_correct
  end
end
