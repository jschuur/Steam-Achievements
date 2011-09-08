Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :twitter, 'pe2PBxy2F7srwSU4U1djQw', 'ylJqclevrCxyVwxq6GdTWcX0Lw14kF9zvTN95c6LXW4'
  else
    provider :twitter, 'TQRFmiqjznB9ATMByg', 'IOFoBk0RmpIE6i9YGLa8FZfetlrZlBPjbV2CLAwnM'
  end
end