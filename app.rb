require 'rubygems'
require 'sinatra'
require 'mandrill'

get '/' do
  erb :index
end

# This sends an emaili to a given email
post '/' do
  m = Mandrill::API.new 'asEPl1ngRJzo6FdKFQhsgw'

  message = {  
    :subject=> "Damilola Odelola business card",  
    :from_name=> "Damilola Odelola",  
    :to=>[
      {  
       :email=> "#{params["email"]}" 
      }  
    ],
    :attachments => [{
      "type" => "text/vcard",
      "name" => "Damilola Odelola.vcf",
      "content" => "QkVHSU46VkNBUkQNClZFUlNJT046My4wDQpQUk9ESUQ6LS8vQXBwbGUgSW5jLi8vTWFjIE9TIFg
      gMTAuMTAvL0VODQpOOk9kZWxvbGE7RGFtaWxvbGE7OzsNCkZOOkRhbWlsb2xhIE9kZWxvbGENCk
      9SRzp3cml0ZXIgfCBkZXZlbG9wZXIgfCBmb3VuZGVyOw0KRU1BSUw7dHlwZT1JTlRFUk5FVDt0e
      XBlPUhPTUU7dHlwZT1wcmVmOm1lQGRhbWlsb2xhb2RlbG9sYS5jb20NCml0ZW0xLlVSTDt0eXBl
      PXByZWY6d3d3LmRhbWlsb2xhb2RlbG9sYS5jb20NCml0ZW0xLlgtQUJMYWJlbDpfJCE8SG9tZVB
      hZ2U+ISRfDQppdGVtMi5VUkw6d3d3LmJsYWNrZ2lybC50ZWNoDQppdGVtMi5YLUFCTGFiZWw6Ym
      xhY2tnaXJsLnRlY2gNCml0ZW0zLlVSTDp3d3cudHdpdHRlci5jb20vZGFtaW9kZWxvbGENCml0Z
      W0zLlgtQUJMYWJlbDp0d2l0dGVyDQpYLUFCVUlEOjlEOUJEREM3LUU2QkMtNDgxNC05MDY4LUUy
      OTgzNEE5QjkyMzpBQlBlcnNvbg0KRU5EOlZDQVJEDQo="
      }], 
    :html=>"<html><p>Hi,<br>
    This email is being sent to you because: <br>
    <ol>
      <li> You asked me to </li>
      <li> You want a vcard version of my contact details (in the event you lose the business card or drown your wallet in a puddle)</li>
    </ol>
    Feel free to download my details onto your phone or other digital device.<br>
    Best, <br>
    Damilola Odelola</p></html>",  
    :from_email=>"me@damilolaodelola.com"  
  }  
  sending = m.messages.send message  
  puts sending

  erb :post
end