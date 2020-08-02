require "application_system_test_case"

class OpcaosTest < ApplicationSystemTestCase
  setup do
    @opcao = opcaos(:one)
  end

  test "visiting the index" do
    visit opcaos_url
    assert_selector "h1", text: "Opcaos"
  end

  test "creating a Opcao" do
    visit opcaos_url
    click_on "New Opcao"

    fill_in "Enquete", with: @opcao.enquete_id
    fill_in "Nome", with: @opcao.nome
    fill_in "Pontos", with: @opcao.pontos
    click_on "Create Opcao"

    assert_text "Opcao was successfully created"
    click_on "Back"
  end

  test "updating a Opcao" do
    visit opcaos_url
    click_on "Edit", match: :first

    fill_in "Enquete", with: @opcao.enquete_id
    fill_in "Nome", with: @opcao.nome
    fill_in "Pontos", with: @opcao.pontos
    click_on "Update Opcao"

    assert_text "Opcao was successfully updated"
    click_on "Back"
  end

  test "destroying a Opcao" do
    visit opcaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Opcao was successfully destroyed"
  end
end
