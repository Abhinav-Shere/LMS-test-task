Sequent.configure do |config|
  # Event store
  config.event_store = Sequent::Core::EventStore.new

  # Set database config directory (Sequent uses config/database.yml by default)
  config.database_config_directory = 'config'

  # Register command handlers here
  config.command_handlers = [
    # Example: UserCommandHandler.new
  ]
end
