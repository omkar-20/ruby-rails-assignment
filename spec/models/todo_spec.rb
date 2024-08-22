require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      todo = Todo.new(title: 'test todo', description: 'This is a test description', completed: false)
      expect(todo).to be_valid
    end

    it 'is not valid without a title' do
      todo = Todo.new(title: nil, description: 'This is test description', completed: false)
      expect(todo).not_to be_valid
    end

    it 'is not valid without a description' do
      todo = Todo.new(title: 'test todo', description: nil, completed: false)
      expect(todo).not_to be_valid
    end

    it 'is not valid without a description character less than 10' do
      todo = Todo.new(title: 'test todo', description: 'test', completed: false)
      expect(todo).not_to be_valid
    end

  end
end
