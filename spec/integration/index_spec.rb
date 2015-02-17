describe 'Index' do
  before do
    Vote.create(campaign: 'New York Campaign')
    Vote.create(campaign: 'West London Campaign')
  end

  it do
    visit '/'
    expect(page).to have_content 'New York Campaign'
    expect(page).to have_content 'West London Campaign'
  end
end
