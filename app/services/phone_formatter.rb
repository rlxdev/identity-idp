class PhoneFormatter
  def format(phone)
    phone&.phony_normalized(default_country_code: :us)&.
      phony_formatted(format: :international, spaces: ' ')
  end
end
