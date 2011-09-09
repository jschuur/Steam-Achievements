Rails.application.config.middleware.use OmniAuth::Builder do
  # Get your credentials from http://dev.twitter.com
  if Rails.env.development?
    provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  else
    provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  end
end