#  HOW TO USE:
# gem install http
# gem install csv
# ruby slack-invite.rb API_TOKEN, SUBDOMAIN, CSV_EMAIL_FILE

require 'csv'
require 'http'

# Class for sending invites through the slack API
class SlackInvite
  attr_reader :api_token, :subdomain
  def initialize(api_token, subdomain)
    @api_token = ENV["SLACK_API_TOKEN"]
    @subdomain = ENV["SLACK_SUBDOMAIN"]
  end

  def send_invite(email)
    body = {
      form: {
        email: email,
        token: api_token,
        set_active: true,
        resend: true
      }
    }

    response = HTTP.auth("Bearer #{api_token}").post("https://#{subdomain}.slack.com/api/users.admin.invite", body)
  end
end

# Set arguments
api_token = ARGV[0]
subdomain = ARGV[1]
csv_file  = ARGV[2]

slack = SlackInvite.new(api_token, subdomain)
CSV.foreach(csv_file) do |email|
  slack.send_invite(email)
end
