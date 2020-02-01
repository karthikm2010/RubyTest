# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.7.0

* Rails version - 5.0.7.2

* Configuration

  1) Create User email setup :  curl -d "user[email]=email_id" http://localhost:3000/users 
  2) Upload image through API : curl -i -X POST -H "Content-Type: multipart/form-data"  -F "file=@/complete_path_of_image" -F "image[email]=email_id" http://localhost:3000/images/compress 
  3) Email will be triggered if user & images are valid. It should be in the below format,
  

    Rendering user_mailer/notification_email.html.erb within layouts/mailer
    Rendered user_mailer/notification_email.html.erb within layouts/mailer (1.5ms)
  UserMailer#notification_email: processed outbound mail in 174.3ms
  Sent mail to Karthik (7.9ms)
  Date: Sat, 01 Feb 2020 19:10:59 +0100
  From: notifications@test.com
  To: Karthik
  Message-ID: <5e35bf33ef99a_5b2fcb9867636@Karthiks-MBP.mail>
  Subject: Welcome to My Test Site
  Mime-Version: 1.0
  Content-Type: text/html;
   charset=UTF-8
  Content-Transfer-Encoding: 7bit

  <!DOCTYPE html>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <style>
        /* Email styles need to be inline */
      </style>
    </head>

    <body>
      <!DOCTYPE html>
  <html>
    <head>
      <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
    </head>
    <body>
      <h1>Dear User!!</h1>
      <p>
        You have successfully compressed the image and you can download in http://localhost:3000/images/1/download.<br>
      </p>
    
      <p>Thanks and have a great day!</p>
    </body>
  </html>
    </body>
  </html>

  Completed 204 No Content in 493ms (ActiveRecord: 10.9ms)


  Started GET "/sidekiq/stats" for ::1 at 2020-02-01 19:11:03 +0100
  
 
 
  
  4) If we click the link in the above email, corresponding image will be downloaded