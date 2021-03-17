describe 'seleciona botão radio', :seleciona_Radio do
      before(:each) do
      visit 'http://qcdev.dimepkairos.com.br/'  
      fill_in 'LogOnModel_UserName', with: 'treino@dimep.com'
      fill_in 'LogOnModel_Password', with: 'dimep123'
      click_button 'Entrar'
      visit 'http://qcdev.dimepkairos.com.br/Dimep/Empresas/Create'
  
    end
         it 'alterar o radio', :alterarRadio do  #incompleto
            fill_in 'Empresa_Codigo', with: '123'
            fill_in 'Empresa_CEI', with: '235669120286'
            fill_in 'Empresa_Telefone', with: '999999999'
            fill_in 'Empresa_RazaoSocial', with: 'abc'
            fill_in 'Empresa_CnpjCpf', with: '27744369000165'
            drop.find('option', text: 'INDÚSTRIAS EXTRATIVAS').select_option
            fill_in 'Empresa_Endereco', with: 'rua abcd'
            fill_in 'Empresa_Bairro', with: 'abcd'
            fill_in 'Empresa_Cidade', with: 'abcd'
            fill_in 'Empresa_UF', with: 'SP'
            fill_in 'Empresa_DataAbertura', with: '10112020'
        
            drop = find("input[type=button][value='Salvar']", match: :first)
            drop.click
            
            expect(find('div[id=Summary-Field-Index]')).to have_content 'A Empresa foi criada com sucesso'
          end
        
        after(:each) do
        sleep 3
    end  
end