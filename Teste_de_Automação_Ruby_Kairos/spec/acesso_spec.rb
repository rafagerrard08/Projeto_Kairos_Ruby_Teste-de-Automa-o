describe 'Meu primeiro script', :script do
    it 'Visitar a página' do
      visit 'https://www.dimepkairos.com.br/'
      expect(page.title).to eql "kairos"
      puts page.title
      sleep 3
    end
  end