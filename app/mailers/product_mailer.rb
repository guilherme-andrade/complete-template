class ProductMailer < ApplicationMailer
  def creation_confirmation(product)
    @product = product

    mail(
      to:       @product.user.email,
      subject:  "#{@product.class} #{@product.name} created!"
    )
  end
end
