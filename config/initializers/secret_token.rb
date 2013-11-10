# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Derpbox::Application.config.secret_key_base = '9e2783e2e1bcacdfd577988e4cbfaedffa27355fc8c2015ac8e8d3bcfcba7b58002bdc20ffff15c7877bd0a3467747bc19703e354ee0be503d7dbf3104ce5b2d'
Derpbox::Application.config.secret_token = if Rails.env.development? or Rails.env.test?
  ('x' * 30) # meets minimum requirement of 30 chars long
else
  ENV['SECRET_TOKEN']
end