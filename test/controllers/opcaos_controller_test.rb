require 'test_helper'

class OpcaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opcao = opcaos(:one)
  end

  test "should get index" do
    get opcaos_url
    assert_response :success
  end

  test "should get new" do
    get new_opcao_url
    assert_response :success
  end

  test "should create opcao" do
    assert_difference('Opcao.count') do
      post opcaos_url, params: { opcao: { enquete_id: @opcao.enquete_id, nome: @opcao.nome, pontos: @opcao.pontos } }
    end

    assert_redirected_to opcao_url(Opcao.last)
  end

  test "should show opcao" do
    get opcao_url(@opcao)
    assert_response :success
  end

  test "should get edit" do
    get edit_opcao_url(@opcao)
    assert_response :success
  end

  test "should update opcao" do
    patch opcao_url(@opcao), params: { opcao: { enquete_id: @opcao.enquete_id, nome: @opcao.nome, pontos: @opcao.pontos } }
    assert_redirected_to opcao_url(@opcao)
  end

  test "should destroy opcao" do
    assert_difference('Opcao.count', -1) do
      delete opcao_url(@opcao)
    end

    assert_redirected_to opcaos_url
  end
end
