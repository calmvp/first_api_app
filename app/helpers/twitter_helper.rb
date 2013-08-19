
def client
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = "fWVLFOjEyCu9HUbmrbQQ"
    config.consumer_secret = "2uFXgpQIszGeruUMZ1mpz8iN01YlkgjWI8AcZ9MOhc"
    config.access_token = "54656020-ykWvUUWcr2e5HJ9jHwVwmMPpGMmiJOCOBYVFLlRq4"
    config.access_token_secret = "SXtuNiflJ2tqXVBKA0yvU8Y1q2xB4YqqVfElJMMquw"
  end  
end