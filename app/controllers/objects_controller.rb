class ObjectsController < ApplicationController
    respond_to :html, :json

    def get_class
        User
    end

    def get_object_identifier
        name = get_class().name.downcase
        name.to_sym
    end

    def get_objects_identifier
        name = get_object_identifier.to_s
        name = name.pluralize
        name.to_sym
    end
    def set_variable_collection
        variable = ("@" + get_objects_identifier.to_s).to_sym
        instance_variable_set variable, @objects
    end
    def set_variable
        variable = ("@" + get_object_identifier.to_s).to_sym
        instance_variable_set variable, @object
    end
    # GET /objects
    # GET /objects.json
    def index
        @objects = get_class.all
        set_variable_collection
        respond_with @objects
    end

      # GET /objects/1
      # GET /objects/1.json
    def show
        @object = get_class.find(params[:id])
        set_variable
        respond_with @object
    end

    # GET /objects/new
    # GET /objects/new.json
    def new
        @object = get_class.new
        set_variable
    end

    # GET /objects/1/edit
    def edit
        @object = get_class.find(params[:id])
        set_variable
        respond_with @object
    end

    # POST /objects
    # POST /objects.json
    def create
        @object = get_class.new(params[get_object_identifier])
        set_variable
        @object.save
        respond_with @object
    end

    # PUT /objects/1
    # PUT /objects/1.json
    def update
        @object = get_class.find(params[:id])
        set_variable
        if @object.update_attributes(params[get_object_identifier])
            respond_with @object
        else
            render :action => 'edit'
        end
    end

    # DELETE /objects/1
    # DELETE /objects/1.json
    def destroy
        @object = get_class.find(params[:id])
        @object.destroy
        redirect_to get_objects_identifier
    end
end
