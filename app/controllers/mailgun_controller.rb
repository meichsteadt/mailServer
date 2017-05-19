class MailgunController < ApplicationController
  def create
    if authenticate?(params[:key], params[:password])
      email = Base64.decode64(params[:email])
      name = Base64.decode64(params[:name])
      message = Base64.decode64(params[:message])
      phone = Base64.decode64(params[:phone])
      company = Base64.decode64(params[:company])
      budget = Base64.decode64(params[:budget])
      referal = Base64.decode64(params[:referal])
      RestClient.post("https://api:#{ENV['MAILGUN_API']}@api.mailgun.net/v3/sandboxe327d33e3d1e4723a0bfcfb192729be0.mailgun.org/messages",
        :from => "Mailgun Sandbox <postmaster@sandboxe327d33e3d1e4723a0bfcfb192729be0.mailgun.org>",
        :to => "Ichor <matt@ichorstudios.com>",
        :subject => "New Message from " + name,
        :text =>  'name: ' + name + "\n" +
                  'message: ' + message + "\n" +
                  'company: ' + company + "\n" +
                  'email: ' + email + "\n" +
                  'phone: ' + phone + "\n" +
                  'referal: ' + referal + "\n" +
                  'budget: ' + budget
      )
      render json: {data: "message sent"}
    else
      render json: {data: "not authenticated"}
    end
  end
end
