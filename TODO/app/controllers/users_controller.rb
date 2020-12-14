# frozen_string_literal: true

# class responsible for creating and deleting users
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :authenticate, only: :index

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    redirect_to signup_path
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'Успешная регистрация!' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(new_user_params)
        format.html { redirect_to root_path, notice: 'Данные обновлены!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    Task.where(owner: @user.id).destroy_all
    @user.destroy
    respond_to do |format|
      format.html { redirect_to login_path, notice: 'Аккаунт удален' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if !User.exists?(params[:id]) || User.find(params[:id]) != current_user
      redirect_to warning_path
    else
      @user = User.find(params[:id])
    end
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def new_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
