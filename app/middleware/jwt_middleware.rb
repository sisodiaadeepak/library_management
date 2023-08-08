class JwtMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if valid_token?(env)
      @app.call(env)
    else
      [401, { 'Content-Type' => 'application/json' }, [{ error: 'Unauthorized' }.to_json]]
    end
  end

  private

  def valid_token?(env)
    token = env['HTTP_AUTHORIZATION']&.split(' ')&.last
    return false if token.blank?

    payload = JwtService.decode(token)
    payload.present? && payload[:user_id].present?
  end
end
