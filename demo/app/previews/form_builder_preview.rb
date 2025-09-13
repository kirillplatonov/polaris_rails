class FormBuilderPreview < Lookbook::Preview
  def text_field
    product = Product.new(title: "Product Name")
    render_with_template(locals: {product: product})
  end

  def errors
    product = Product.new
    product.errors.add(:title, "can't be blank")
    render_with_template(locals: {product: product})
  end
end
