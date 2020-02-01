class ImageProcessWorker
  include Sidekiq::Worker

  def perform(user,params)
    
    if user.update_attributes(image: params[:file])
        UserMailer.notification_email(user).deliver_now
    else
      render json: user, status: :unprocessable_entity
    end
  end
  
end