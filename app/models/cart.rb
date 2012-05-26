class Cart < ActiveRecord::Base
has_many :line_items, dependent: :destroy
before_destroy :ensure_not_referenced_by_any_line_item


   def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
      if current_item
	current_item.quantity += 1
      else
	current_item = line_items.build(product_id: product_id)
      end
	current_item
    end
  def total_price
	line_items.to_a.sum { |item| item.total_price }
  end



private

def ensure_not_referenced_by_any_line_item
  if line_items.empty?
return true
else
errors.add(:base, 'Line Items present')
return false
end
end

end

