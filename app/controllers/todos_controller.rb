class TodosController < ApplicationController
  before_action :authenticate_user

  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      redirect_to @todo
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :completed)
  end

  private

  def authenticate_user
    token = request.headers['Authorization'].split(' ')[1] rescue nil
    if token
      begin
        decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        @current_user = User1.find(decoded_token['user_id'])
      rescue JWT::DecodeError
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
