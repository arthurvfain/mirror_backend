Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https:\/\/nostalgic-feynman-4827a1.netlify.app\/([a-z0-9])*'

    resource '*',
      headers: :any,
      expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end