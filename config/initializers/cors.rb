Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://nostalgic-feynman-4827a1.netlify.app', 'http://localhost:3000'

    resource '*',
      headers: :any,
      expose: ['access-token', 'expiry', 'token-type', 'uid', 'client', 'set-cookie'],
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
      # exposedHeaders: ["Set-Cookie"]
  end
end