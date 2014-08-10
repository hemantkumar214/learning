class MemberMailer < ActionMailer::Base
  default from: "hemant.trigunayat@gmail.com"

  def welcome_email(member)
  	@member=member
  	@email=@member[:email]
  	@membername=@member[:username]
  	@password=@member[:password]
  	puts "passed parameter for email: #{@member}"
  	url = "http://localhost:3000/members/sign_in"
  	mail(to: @email, subject:"Login your account")
  end
end
