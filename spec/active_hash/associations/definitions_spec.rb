class Item < ActiveHash::Base
  include ActiveHash::Associations
  include ActiveHash::Associations::Definitions

  field :parent_id

  belongs_to :parent, foreign_key: :parent_id, class_name: self.name
  has_many :children, foreign_key: :parent_id, class_name: self.name
end

describe ActiveHash::Associations::Definitions do
  context 'belongs_to' do
    let :definition do
      Item.association_definition(:parent)
    end

    it 'gets definition' do
      expect(definition.name).to eq(:parent)
      expect(definition.options[:foreign_key]).to eq(:parent_id)
    end
  end

  context 'has_many' do
    let :definition do
      Item.association_definition(:children)
    end

    it 'gets definition' do
      expect(definition.name).to eq(:children)
      expect(definition.options[:foreign_key]).to eq(:parent_id)
    end
  end
end
