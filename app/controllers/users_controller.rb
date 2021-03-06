class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

      if @user.save
        cookies.encrypted.permanent[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Your account was successfully created. Enjoy your time on our website!"
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
      if @user.update(user_params)
        redirect_to users_url(@user), notice: "User was successfully deleted."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    cookies.delete :user_id

    redirect_to articles_showAll_path, status: :see_other, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
