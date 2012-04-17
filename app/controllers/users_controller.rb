class UsersController < ApplicationController
    respond_to :html, :json
    # GET /users
    # GET /users.json
    def index
        @users = User.all
        respond_with @users
    end

      # GET /users/1
      # GET /users/1.json
    def show
        @user = User.find(params[:id])
        respond_with @user
    end

    # GET /users/new
    # GET /users/new.json
    def new
        @user = User.new
    end

    # GET /users/1/edit
    def edit
        @user = User.find(params[:id])
        respond_with @user
    end

    # POST /users
    # POST /users.json
    def create
        @user = User.new(params[:user])
        @user.save
        respond_with @user
    end

    # PUT /users/1
    # PUT /users/1.json
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
            respond_with @user
        else
            render :action => 'edit'
        end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to :users
    end
end