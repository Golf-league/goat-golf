class ScoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @scores = Score.all
  end

  def show
  end

  def new
    @score = Score.new
  end

  def create
    Score.create(score_params.merge(user: current_user))
    redirect_to "/scores"
  end

  def score_params
    params.require(:score).permit(:date, :course, :handicap, :strokes, :stableford)
  end
end
