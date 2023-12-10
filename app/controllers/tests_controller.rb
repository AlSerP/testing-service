class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def solve
    @test = Test.find(params[:test_id])
    solution = @test.solve params

    # redirect_to action: 'results'
    redirect_to "/tests/#{@test.id}/solutions/#{solution.id}"
  end

  def results
    @test = Test.find(params[:test_id])
  end
end
