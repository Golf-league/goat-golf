class LeaderboardController < ApplicationController
  def leaderboard
    @users = User.all.sort_by{ |user| user.total_score }.reverse
  end

  def this_year
    @users = User.all.sort_by{ |user| user.total_score }.reverse
  end
end
