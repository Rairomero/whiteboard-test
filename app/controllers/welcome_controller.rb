class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.character.present?
      @character = current_user.character
    else
      redirect_to new_character_path
    end
  end
end
