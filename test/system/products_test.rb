require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    # setup => feito pelas fixtures

    # exercise
    visit root_url

    # verify
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count

    # teardown => feito automaticamente ao fim de todo teste
  end

  test "create a new product" do
    # o user precisa logar
    login_as users(:emilio)

    # tem que entrar na pagina de new product (form)
    visit new_product_url

    # tem que preencher o form da maneira correta (name & tagline)
    fill_in "product_name", with: 'Batata'
    fill_in "product_tagline", with: 'Você já sabe que poderia ser qualquer coisa'

    # tem que enviar o form
    click_on "Create Product"

    # tem que ser redirecionado para o index de products
    assert_current_path root_path

    # o produto criado tem que estar no index
    assert_text "Batata"
    assert_text "Você já sabe que poderia ser qualquer coisa"
  end

  test "fail to create a new product" do
    # ...
  end
end
