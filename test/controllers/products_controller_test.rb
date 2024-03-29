require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "description", "tax", "total", "inventory", "supplier", "images"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "test product", price: 1, image_url: "image.jpg", description: "test description", 
      supplier_id: Supplier.first.id  },
        headers: { "Authorization" => "Bearer #{@jwt}" }
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {},
      headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 422
    end
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price.to_s, data["price"]
    assert_equal product.image_url, data["image_url"]
    assert_equal product.description, data["description"],
    headers: { "Authorization" => "Bearer #{@jwt}" }

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json",
      headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end

end
