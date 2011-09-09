Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :twitter, 'JuQ70FtkVYtUMl5WBu0yA', 'z17YdXIPJabg30hbE5ToYRYmmYJ3fJ1KbiBrpimi37g'
  else
    provider :twitter, 'TQRFmiqjznB9ATMByg', 'IOFoBk0RmpIE6i9YGLa8FZfetlrZlBPjbV2CLAwnM'
  end
end