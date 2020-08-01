class Category < ApplicationRecord
    has_many :children, :class_name => "Category", foreign_key: :parent_id
    belongs_to :parent, :class_name => "Category", :optional => true, foreign_key: 'parent_id'

    scope :macroCategories, -> {where(parent_id: nil)}
    scope :subCategories, -> {where.not(parent_id: nil)}
    
    def self.parent_list
        current_parent = self.parent
        parent_to_return = []
        while current_parent.present?
            parent_to_return << current_parent
            current_parent = current_parent.parent
        end
        parent_to_return
    end

    def self.all_descendents(current_category)
        childs_to_visit = Category.where(parent_id: current_category.id).to_a
        childs_to_return = []
        while childs_to_visit.present?
          current_node = childs_to_visit.shift
          childs_to_return << current_node
          childs_to_visit.concat(current_node.children)
        end
        childs_to_return
    end

    def self.descendents(category)
        childs = Category.where(parent_id: category.id).to_a
        childs
    end

end
