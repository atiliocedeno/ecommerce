class Product < ApplicationRecord
    has_many :subProducts, class_name: 'Product', foreign_key: 'parent_id'
    belongs_to :macroProduct, class_name: 'Product', optional: true

    has_many :product_categories
    has_many :categories, through: :product_categories
    has_many :order_items
    has_many :orders, through: :order_items


    scope :with_stock, -> { where("stock > 0") }

    def self.available_product
        products = Product.all
        return_catalog = []
        products.each do |b|
            if b.variante_with_stock(b).present?
                return_catalog << b.variante_with_stock(b)
            end
        end
        return_catalog
    end


    def variante_with_stock(product)
        if Product.find(product.id).stock.present?
            if Product.find(product.id).stock > 0
                product
            end
        end
    end

    def self.one_product_per_variant
        catalog = Product.available_product
        catalog.uniq!(&:parent_id)
        cat = []
        catalog.each do |c|
            cat <<   c
        end
        cat
    end
end
