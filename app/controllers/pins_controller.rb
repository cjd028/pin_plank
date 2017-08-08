class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
  # before_action :athenticate_user!, except: [:index]

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pin = Pin.new
    @user = current_user
  end
  

  def create

    @pin = Pin.new(pin_params)
    @pin.user_id = current_user.id

    if @pin.save
      # redirect_to pin_url(@pin)
      redirect_to pin_path(@pin), notice: "Pin created successfully!"
    else
      render 'new'
    end
  end

    def edit
    end

    def update
      if @pin.update(pin_params)
        redirect_to @pin, notice: "Pin updated successfully"
      else
        render 'edit'
      end  
    end

    def destroy
      @pin.destroy
      render json: {status: "success"}
    end

    def upvote
      @pin.upvote_by current_user
      redirect_to "/pins/#{@pin.id}"
    end
  

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
