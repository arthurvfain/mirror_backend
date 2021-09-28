Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://nostalgic-feynman-4827a1.netlify.app/'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end