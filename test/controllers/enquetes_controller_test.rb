require 'test_helper'

class EnquetesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enquete = enquetes(:one)
  end

  test "should get index" do
    get enquetes_url
    assert_response :success
  end

  test "should get new" do
    get new_enquete_url
    assert_response :success
  end

  test "should create enquete" do
    assert_difference('Enquete.count') do
      post enquetes_url, params: { enquete: { descricao: @enquete.descricao, titulo: @enquete.titulo } }
    end

    assert_redirected_to enquete_url(Enquete.last)
  end

  test "should show enquete" do
    get enquete_url(@enquete)
    assert_response :success
  end

  test "should get edit" do
    get edit_enquete_url(@enquete)
    assert_response :success
  end

  test "should update enquete" do
    patch enquete_url(@enquete), params: { enquete: { descricao: @enquete.descricao, titulo: @enquete.titulo } }
    assert_redirected_to enquete_url(@enquete)
  end

  test "should destroy enquete" do
    assert_difference('Enquete.count', -1) do
      delete enquete_url(@enquete)
    end

    assert_redirected_to enquetes_url
  end
end
