class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params.require(:answer).permit(:body))
    if @answer.save
      redirect_to @answer.question
    else
      render :edit
    end
  end
end
