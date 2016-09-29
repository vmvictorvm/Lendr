class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user

  def new
    @checkout = @user.checkouts.new
  end

  def create
    item = params[:item_id]
    @checkout = Checkout.new(user_id: current_user.id, item_id: item)
    if @checkout.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    puts params[:id]
    @checkout = Checkout.find(params[:id])
    # @checkout = Checkout.where(id: params[:id])
    @checkout.update_attribute(:check_initial, true)
    @checkout.save
    redirect_to user_path
  end

  def destroy
    @checkout = Checkout.find(params[:id])
    @checkout.destroy
    redirect_to user_path
  end

  private
  def checkout_params
    params.require(:checkouts).permit(:item_id)
  end

  def set_user
    @user = current_user
  end

end
