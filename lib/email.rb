require 'rubygems'
require 'bundler/setup'
require 'thin'
require 'mandrill'

class MyEmailer
  def send(email)
    m = Mandrill::API.new
    message = {
     :subject=> "Hello from the Mandrill API",
     :from_name=> "Your name",
     :text=>"Hi message, how are you?",
     :to=>[
       {
         :email=> "#{email}",  ## this uses the email argument passed into this method
         :name=> "Recipient1"
       }
     ],
     :html=>"<h1>Hi <strong>message</strong>, how are you?</h1>",
     :from_email=>"wndyhsu@gmail.com"
    }
    sending = m.messages.send message
    puts sending

  end
end
