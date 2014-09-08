class MemberMailer < Devise::Mailer
  default from: "rorappraisal@gmail.com"

  def welcome_email(member)
  	@member=member
  	@email=@member[:email]
  	@membername=@member[:username]
  	@password=@member[:password]
  	puts "passed parameter for email: #{@member}"
  	url = "http://localhost:3000/members/sign_in"
  	mail(to: @email, subject:"Login your account")
  end

  def confirmation_instructions(record, token, opts = {})    
    @resource=record
    @token=token        
    @email=record.email
    @membername=record.username
    @password=record.password     
    mail(to: @email, subject:"confirm your mail id")
  end
end


