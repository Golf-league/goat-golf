feature 'About page' do
  scenario 'Visit the leaderboard page' do
    visit '/leaderboard'
    expect(page).to have_content 'Leaderboard'
  end

end
