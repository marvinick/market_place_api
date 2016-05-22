class EnoughProductsValidator < ActiveModel::Validator 
  def validate(record)
    record.placements.each do |placement|
      product = placement.product
      if placement.quantity > product.quantity
        record.errors["#{product.title}"] << "Is out od stock, only #{product.quantity} left"
      end
    end
  end
end