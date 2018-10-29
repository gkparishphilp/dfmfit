Pulitzer.configure do |config|

	config.app_name = ENV['APP_NAME'] || 'Crossfit 2120'

	config.app_host = ENV['APP_DOMAIN'] || 'localhost:3003'

	config.article_path = 'workouts'

	config.default_protocol = 'https' unless Rails.env.development?

	config.froala_editor_key = ENV['FROALA_EDITOR_KEY']

end
