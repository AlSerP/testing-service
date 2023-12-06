class Test < ApplicationRecord
  has_many :questions

  def solve(answers)
    counter = 0

    answers.each do |answer|
      ans = Answer.find(answer)

      counter += 1 if ans.is_correct
    end

    mark = counter.to_f / questions.size 
    Solution.create!(mark: mark)
  end
end
