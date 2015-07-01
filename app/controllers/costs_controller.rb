class CostsController < ApplicationController

before_action :set_user
  
  def index
  	@costs = current_user.costs
  end

  def new
  	@cost = Cost.new
  end

  def create 
  	@cost = current_user.costs.build(cost_params)

  		if @cost.update(cost_params)
  			redirect_to user_cost_path(current_user, @cost)
  		else
  			render 'new'
  		end 
  end
			
  def show
  	@cost = current_user.costs.find(params[:id])
  end

  def edit
  	@cost = Cost.find(params[:id])
  end

  def update 
  	@cost = current_user.costs.find(cost_params)

  	if @cost.update(cost_params)
  		redirect_to user_cost_path(current_user, @cost)
  	else
  		render 'edit'
  	end
  end

  def destroy 
  	@cost = @user.costs.find(params[:id])
  	@cost.destroy

  	redirect_to user_costs_path(current_user)
  end


  private 
  	def cost_params
  		params.require(:cost).permit(:title, :description, :price)
  	end

    def set_user
      @user = current_user
    end
end
