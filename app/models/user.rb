class User < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  #validates_attachment :image, content_type: { content_type: "application/pdf" }
  #validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :image
  # 
  #validates_attachment :image, content_type: ["image/jpeg", "image/gif", "image/png"]
  # 
  
  def save_attachments(params)
   
    if self.update_attributes(image: params[:file])
      UserMailer.with(user: self).notification_email.deliver_now
    end
  end
  
  
end
