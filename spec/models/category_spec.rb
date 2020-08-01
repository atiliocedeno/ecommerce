require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'scopes category_padre' do
    category_parent1 = Category.create(name: 'Macro1')
    category_parent2 = Category.create(name: 'Macro2')
    category_parent3 = Category.create(name: 'Macro3')
    expect(category_padre.count).to eq 10
  end
end
