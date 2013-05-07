class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  def current_url(new_params)
    url_for params.merge(new_params)
  end
  # GET /messages
  # GET /messages.json
  def index
    # Only get the messages for the user currently signed in
    if current_user.group.messages_released
    	@messages = current_user.messages
    else
    	@messages = {}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { send_data @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    @redirect = false
    if (!(@message.user.group.messages_released) && !(@message.from == current_user.name))
      @redirect = true
    elsif not((@message.user == current_user) || (@message.from == current_user.name))
      @redirect = true
    end
    respond_to do |format|
      if @redirect
      	format.html { redirect_to :action => "index", notice: 'You may not view that.' }
      	format.json { render json: @message.errors, status: :unprocessable_entity }
      else
        format.html # show.html.erb
        format.json { render json: @message }
      end
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    @people = User.where(:group_id => current_user.group_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @people = User.where(:group_id => current_user.group_id)
    @message = Message.find(params[:id])
    @message.user = User.where(:name => @message.to).first
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.user = User.where(:name => @message.to).first
    @message.from = current_user.name
    unless @message.user.image_url.nil?
        @message.associated_images = @message.user.image_url
    end
    respond_to do |format|
      if @message.save && (@message.user.group_id == User.where(:name => @message.from).first.group_id)
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message}
      else
        format.html { render action: "new", notice: 'Users not of the same group' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
