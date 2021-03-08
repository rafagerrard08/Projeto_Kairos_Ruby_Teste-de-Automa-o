describe 'Acessar o site Kairos', :acessar do # tag:dropdown
  it 'Acessando o site' do
    visit 'http://qcdev.dimepkairos.com.br/'
    expect(page.title).to eql "kairos" #verfica se o titulo é igual 
    fill_in 'LogOnModel_UserName', with: 'treino@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    sleep 3
  end

  it 'Validar a inserção dos itens obrigatórios no login de acesso', :validarLogin do
    visit 'http://qcdev.dimepkairos.com.br/'
    fill_in 'LogOnModel_UserName', with: ''
    fill_in 'LogOnModel_Password', with: ''
    click_button 'Entrar'
    expect(find('span[data-valmsg-for="LogOnModel.UserName"]')).to have_content 'O campo Nome do Usuário é obrigatório'
    expect(find('span[data-valmsg-for="LogOnModel.Password"]')).to have_content 'O campo Senha é obrigatório'
    sleep 3
  end

  it 'Validar com itens incorretos os campos de usuário e senha no login de acesso', :loginIncorreto do
    visit 'http://qcdev.dimepkairos.com.br/'
    fill_in 'LogOnModel_UserName', with: 'aaa'
    fill_in 'LogOnModel_Password', with: '111'
    click_button 'Entrar'
    expect(find('span[style="display:inline-block;"]')).to have_content 'Usuário e/ou senha estão incorretos.'
    sleep 3
  end
  
  it 'Ct001 selecionar um item da lista de menu', :ct001_selecionarItem do
    visit 'http://qcdev.dimepkairos.com.br/'
    fill_in 'LogOnModel_UserName', with: 'treino@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    drop = find('.TabMenu')
    drop.find('span', text: 'Banco de Horas').select_option
    sleep 3
  end

  it 'Ct002 selecionar de modo aleatório um item da lista de menu', :ct002_selecionarItem do
    visit 'http://qcdev.dimepkairos.com.br/'
    fill_in 'LogOnModel_UserName', with: 'treino@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    drop = find('.TabMenu')
    drop.all('span').sample.select_option
    sleep 3
  end
end