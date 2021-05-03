require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'has attributes from which it' do
    it { should validate_presence_of(:name) }
    it { should should allow_value(true).for(:done) }
    it { should should allow_value(false).for(:done) }
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
    subject {  build(:item) }
    
    let!(:todo_object) do
      todo_object = build(:todo)
    end

    it 'is expected to be valid' do
      subject.todo = todo_object
      should be_valid
    end
  end
end
