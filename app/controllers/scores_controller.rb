class ScoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @scores = Score.all.ordered
  end

  def show
  end

  def new
    @score = Score.new
  end

  def create
    Score.create(score_params)
    redirect_to "/scores"
  end

  def score_params
    params.require(:score)
          .permit(:course, :handicap, :strokes, :stableford, :user_id, :open_round)
          .merge(date: input_date)
  end

  def input_date
    Date.civil(params[:date]["date(1i)"].to_i,
               params[:date]["date(2i)"].to_i,
               params[:date]["date(3i)"].to_i)
  end
end
