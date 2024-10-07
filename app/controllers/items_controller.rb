class ItemsController < ApplicationController
  before_action :move_to_index, exsept: [:index]

  private

  def move_to_index
    unless user_signed_in?
      redirect_to acrion: index
    end
  end
end
