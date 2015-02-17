describe 'Show' do
  before do
    Vote.create(campaign: 'New York Campaign', choice: 'Antony', validity: 'during')
    Vote.create(campaign: 'New York Campaign', choice: 'Antony', validity: 'during')
    Vote.create(campaign: 'New York Campaign', choice: 'Antony', validity: 'pre')
  end

  it 'displays expected content' do
    visit '/'
    click_on 'New York Campaign'
    expect(page).to have_content 'New York Campaign'
    expect(page).to have_content 'Antony'
    expect(page).to have_content '2'
    expect(page).to have_content '1'
  end
end
