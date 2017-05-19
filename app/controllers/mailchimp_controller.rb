require 'rest-client'

class MailchimpController < ApplicationController
  def create
    if authenticate?(params[:key], params[:password])
      RestClient.post("https://string:#{ENV['MAILCHIMP_API']}@#{ENV['MAILCHIMP_ZONE']}.api.mailchimp.com/3.0/lists/#{ENV['MAILCHIMP_LIST_ID']}/members",
        {
          "email_address" => Base64.decode64(params[:email_address]),
          "status" => "subscribed"
        }.to_json,
        {
          content_type: 'application/json', accept: :json
        }
      )
      render json: {data: "user added to MailChimp"}
    else
      render json: {error: "not authenticated"}
    end
  end
end
