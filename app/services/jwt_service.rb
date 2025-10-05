class JwtService
  APP_SECRET = Rails.application.credentials.dig(:application, :secret_key)
  ALGORITHM = Rails.application.credentials.dig(:application, :algorithm)
  EXPIRES_IN = Rails.application.credentials.dig(:application, :app_expires_in).to_i
  REFRESH_TOKEN_EXPIRES_IN = Rails.application.credentials.dig(:application, :refresh_token_expires_in).to_i

  class << self
    def generate_tokens(user)
      {
        data: user,
        access_token: generate_token(user, EXPIRES_IN, true),
        refresh_token: generate_token(user, REFRESH_TOKEN_EXPIRES_IN, false)
      }
    end

    def generate_token(user, expires_in, access)
      payload = {
        sub: user.id.to_s,
        exp: Time.now.to_i + expires_in
      }
      header = { kid: access ? 'access' : 'refresh' }
      JWT.encode(payload, APP_SECRET, ALGORITHM, header)
    end
  end
end
