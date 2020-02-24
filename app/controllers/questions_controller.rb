class QuestionsController < ApplicationController
  def new
    @unasked_questions_count = Question.unasked.count
  end

  def create
    Question.create(questions_params)

    redirect_to action: :new
  end

  private

  def questions_params
    params.require(:question).permit(:text)
  end
end
