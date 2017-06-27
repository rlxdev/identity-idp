if Rails.env.production?
  MandrillDm.configure do |config|
    config.api_key = Figaro.env.mandrill_api_token
  end
end
