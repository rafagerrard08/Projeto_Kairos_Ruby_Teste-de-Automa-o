describe 'Acessar o site Kairos', :entrarSite do # tag:dropdown
  before(:each) do
    visit 'http://qcdev.dimepkairos.com.br/'
    expect(page.title).to eql 'kairos' # verfica se o titulo é igual
    fill_in 'LogOnModel_UserName', with: 'treino@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    visit 'http://qcdev.dimepkairos.com.br/Dimep/Pessoas/UserProfilePessoas/1'
    @imagem = Dir.pwd + '/spec/fixtures/imagem.png'
    sleep 3
  end

  it 'upload de imagem', :teste do   #incompleto

    drop = find("input[type=button][value='Alterar']", match: :first)
    drop.click

    attach_file('image', @imagem)
    page = find()
    page.click

    img = find('.buttonFile')
    expect(img[:src]).to eql '/uploads/imagem.png'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
    sleep 5 # tempo para carregar a imagem

    expect(find('div[id=Summary-Field-Index]')).to have_content 'Pessoa editada com sucesso'
  end

  after(:each) do
    sleep 5
  end
end
