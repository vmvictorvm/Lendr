class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @borrow          = Checkout.borrow_list(current_user.id)
    @count_inventory = Item.count_inventory(current_user.id)


  end

  private

end
