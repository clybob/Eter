class ObjectsController < ApplicationController
    respond_to :html, :json
    
    def get_class
        User
    end

    def get_object_identifier
        name = get_class().name.downcase
        name.to_sym
    end

    def get_objects_indentifier
        name = get_object_identifier
        name = name.pluralize
        name.to_sym
    end

    # GET /objects
    # GET /objects.json
    def index
        @objects = get_class.all
        variable = ("@" + get_object_identifier.to_s).to_sym
        self.instance_variable_set(variable, @objects)
        puts @editorials
        respond_with @editorials
    end

      # GET /objects/1
      # GET /objects/1.json
    def show
        @object = get_class.find(params[:id])
        respond_with @object
    end

    # GET /objects/new
    # GET /objects/new.json
    def new
        @object = get_class.new
    end

    # GET /objects/1/edit
    def edit
        @object = get_class.find(params[:id])
        respond_with @object
    end

    # POST /objects
    # POST /objects.json
    def create
        @object = get_class.new(params[get_object_identifier])
        @object.save
        respond_with @object
    end

    # PUT /objects/1
    # PUT /objects/1.json
    def update
        @object = get_class.find(params[:id])
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
        redirect_to get_objects_indentifier
    end
end