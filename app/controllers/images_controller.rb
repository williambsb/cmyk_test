class ImagesController < ApplicationController


  private

  def image_params
    params.require(:user).permit({files: []})
  end
end
