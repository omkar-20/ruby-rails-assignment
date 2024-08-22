require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let(:valid_attributes) do
    { title: 'test Todo', description: 'This is a test todo description.', completed: false }
  end

  let(:invalid_attributes) do
    { title: '', description: 'Too short', completed: false }
  end

  describe "GET #index" do
    it 'returns a success response' do
      Todo.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it 'returns a success response' do
      Todo.create! valid_attributes
      get :show, params: { id: todo.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it 'creates a new todo' do
      expect{
        post :create, params: { todo:valid_attributes }
      }.to change(Todo, :count).by(1)
    end

    it 'redirects to created todo'
      post :create, params: { todo: valid_attributes }
      expect(response).to redirect_to(Todo.last)
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the todo and redirects to root path' do
      todo = Todo.create! valid_attributes
      expect {
        delete :destroy, params: {id: todo.id }
      }.to change(Todo, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end
end