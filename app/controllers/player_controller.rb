class PlayerController < ApplicationController

  def show
    puts params
    @player_service = Player.new
    render json: @player_service.get_pairs(params[:number].to_i)
  end
end
