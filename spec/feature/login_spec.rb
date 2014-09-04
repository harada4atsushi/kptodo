require 'spec_helper'  
  
describe 'loginページ' do  
  specify 'タイトルの表示' do  
    visit root_path  
    expect(page).to have_css('h1', text: 'KPTodo')  
  end  
end  