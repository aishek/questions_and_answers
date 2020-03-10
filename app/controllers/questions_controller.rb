class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
    if @question.save
      redirect_to @question
    else
      render :edit
    end
  end
end
