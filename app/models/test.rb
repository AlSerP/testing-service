class Test < ApplicationRecord
  has_many :questions
  has_many :solutions

  def solve(params)
    answers = {}
    counter = [0.0, 0.0]

    params.keys.each do |key|
      sp_key = key.split '_'
      if sp_key.size == 2 && sp_key[0] == 'question'
        ans_id = params[key]

        counter[1] += 1 if Answer.find(ans_id).is_correct
        counter[0] += 1
      end
    end

    mark = counter[1].to_f / counter[0] * 100
    solution = solutions.create!(mark: mark)

    solution
  end
end
