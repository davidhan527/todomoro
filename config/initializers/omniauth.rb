OmniAuth.config.logger = Rails.logger
# this is required otherwise the output is STDOUT

Rails.application.config.middleware.use OmniAuth::Builder do
  # list other providers below here for omniauth authentication
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end