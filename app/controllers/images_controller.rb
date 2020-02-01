class ImagesController < ApplicationController
 
  
  # GET /images
  def compress
    user = User.where(email: image_params[:email]).first
   
    if user.present? && params[:file].present?
      # Small issue with sidekiq. Temporaly commented
      #ImageProcessWorker.perform_async(user, params)
      
      if user.update_attributes(image: params[:file])
          UserMailer.notification_email(user).deliver_now
      else
        render json: user, status: :unprocessable_entity
      end

    else
      render json: user, status: :unprocessable_entity  
    end
    
  end
  
  def download
    user = User.where(id: download_params[:id]).first
    send_file user.image.path, :disposition => 'attachment'
  end

  
  private
    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:email)
    end
    
    def download_params
      params.permit(:id)
    end
end