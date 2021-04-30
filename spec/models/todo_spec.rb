require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'has attributes from which it' do
    it { should validate_presence_of(:title) }
  end

  context 'has associations in which it' do
    it { should have_many(:item).dependent(:destroy) }
  end

  context 'is mapped to a database table in which it' do
    it { should have_db_column(:title).of_type(:string) }
  end
end
