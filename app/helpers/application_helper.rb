module ApplicationHelper
  def players_for_select
    User.all.collect{|b|[b.nickname || b.name, b.id]}
  end
end
