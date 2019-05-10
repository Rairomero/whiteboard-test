class CharactersController < ApplicationController
    before_action :authenticate_user!
    def new
        session[:character_params] ||= {}
        @character = Character.new(session[:character_params])
        @character.current_step = session[:character_step]
        @character.user_id = current_user.id
    end
      
    def create
        # session[:character_params].deep_merge!(params[:character]) if params[:character]
        byebug
        @character = Character.new(session[:character_params])
        @character = Character.new(character_params)
        # @character.current_step = session[:character_step]
        # if @character.valid?
            # if params[:back_button]
                # @character.previous_step
            # elsif @character.last_step?
                @character.save 
                # if @character.all_valid?
            # else
                # @character.next_step
            # end
            # session[:character_step] = @character.current_step
        # end
        # if @character.new_record?
            # render "new"
        # else
            # session[:character_step] = session[:character_params] = nil
            flash[:notice] = "Character saved!"
            redirect_to root_path
        # end
    end

    private

        def character_params
            params.require(:character).permit(:name, :color_claws, :kind, :user_id)
        end
end
  