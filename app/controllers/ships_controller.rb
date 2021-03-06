class ShipsController < ApplicationController
  def create
    if request.xhr?
      p params
      @user = User.find_by(id: session[:user_id])
      @game = Game.find_by(id: params[:game_id])
      @ship = Ship.new(ship_params)
      puts "cheeky cheese"
      if !@game.ship_there?(@user, @ship)
        if @ship.save
          @game.ships << @ship
          @user.ships << @ship
          @game.save
          @user.save
          # {ready: }
          render json: { not_ready: "yes"}, status: 201
        else
          render json: { not_ready: "yes"}, status: 200
        end
      end
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:x_coord, :y_coord, :classification, :size)
  end


end


