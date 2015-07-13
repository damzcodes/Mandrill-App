require 'rubygems'
require 'sinatra'
require 'mandrill'

get '/' do
  erb :index
end

# This sends an emaili to a given email
post '/' do
  m = Mandrill::API.new 'RXuMBikZdJ2Zhvd_FdrM5Q'

  message = {  
    :subject=> "Hello from the Mandrill API",  
    :from_name=> "Your name",  
    :to=>[
      {  
       :email=> "#{params["email"]}",  
       :name=> "Recipient1"  
      }  
    ],  
    :html=>"<html><h1>Hi this is a test</h1></html>",  
    :from_email=>"d.odelola@livelinktechnology.net"  
  }  
  sending = m.messages.send message  
  puts sending

  erb :post
end