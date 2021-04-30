require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'has attributes from which it' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:done) }
  end

  context 'has associations in which it' do
    it { should belong_to(:todo) }
  end

  context 'is mapped to a database table in which it' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:done).of_type(:boolean) }
    it { should have_db_column(:todo_id).of_type(:integer) }
  end

  context 'has a factory that' do
    subject {build(:item)}
    it { should be_valid }
  end
end
