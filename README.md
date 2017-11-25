# Slack Invite

A simple script to take a csv file of emails and send them slack invites automatically

## How to use:

### Requirements:
`http` and `csv` gems
- `gem install http`
- `gem install csv`

##$$ Issue token
**You should generate the token in admin user, not owner.** If you generate the token in owner user, a `missing_scope` error may occur.

There are two ways to issue the access token.

### Legacy tokens
1. Visit <https://api.slack.com/custom-integrations/legacy-tokens>.
1. Click `Create token`.

    ![](https://raw.github.com/outsideris/slack-invite-automation/master/screenshots/legacy-token.gif)


### How to run
- `ruby slack-invite.rb API_TOKEN, SUBDOMAIN, CSV_EMAIL_FILE`
