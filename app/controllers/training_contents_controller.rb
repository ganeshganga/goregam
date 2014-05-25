class TrainingContentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :get_user, :only => [:index,:new,:edit]
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create]
  load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]
 # GET /training_contents
  # GET /training_contents.json
  def index
    @training_contents = TrainingContent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @training_contents }
    end
  end

  # GET /training_contents/1
  # GET /training_contents/1.json
  def show
    @training_content = TrainingContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @training_content }
    end
  end

  # GET /training_contents/new
  # GET /training_contents/new.json
  def new
    @training_content = TrainingContent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @training_content }
    end
  end

  # GET /training_contents/1/edit
  def edit
    @training_content = TrainingContent.find(params[:id])
  end

  # POST /training_contents
  # POST /training_contents.json
  def create
    @training_content = TrainingContent.new(params[:training_content])

    respond_to do |format|
      if @training_content.save
        format.html { redirect_to @training_content, notice: 'TrainingContent was successfully created.' }
        format.json { render json: @training_content, status: :created, location: @training_content }
      else
        format.html { render action: "new" }
        format.json { render json: @training_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /training_contents/1
  # PUT /training_contents/1.json
  def update
    @training_content = TrainingContent.find(params[:id])

    respond_to do |format|
      if @training_content.update_attributes(params[:training_content])
        format.html { redirect_to @training_content, notice: 'TrainingContent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @training_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_contents/1
  # DELETE /training_contents/1.json
  def destroy
    @training_content = TrainingContent.find(params[:id])
    @training_content.destroy

    respond_to do |format|
      format.html { redirect_to training_contents_url }
      format.json { head :no_content }
    end
  end
end
