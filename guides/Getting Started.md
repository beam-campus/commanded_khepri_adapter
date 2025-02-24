# Getting started

The package can be installed from hex as follows.

1. Add `commanded_khepri_adapter` to your list of dependencies in `mix.exs`:

   ```elixir
   def deps do
     [{:commanded_khepri_adapter, "~> 0.1.0"}]
   end
   ```

2. Define and configure your Commanded application:

   ```elixir
   defmodule MyApp.Application do
     use Commanded.Application, otp_app: :my_app
   end
   ```

3. Configure the Commanded application to use the `Commanded.EventStore.Adapters.Khepri` adapter and set the connection settings for the Event Store you are using:

   ```elixir
   # config/config.exs
   config :my_app, MyApp.Application,
     event_store: [
       adapter: Commanded.EventStore.Adapters.Khepri,
       serializer: Commanded.Serialization.JsonSerializer,
       stream_prefix: "myapp",
       khepri: [
         db_type: :node,
         host: "localhost",
         port: 1113,
         username: "admin",
         password: "changeit",
         reconnect_delay: 2_000,
         max_attempts: :infinity
       ]
     ]
   ```

   Refer to the [Extreme](https://hexdocs.pm/extreme/) library documentation for details on the available connection settings.

   **Note:** Stream prefix _must not_ contain a dash character ("-").

## Running the Event Store

You **must** run the Event Store with all projections _enabled_ and standard projections _started_.

Use the `--run-projections=all --start-standard-projections=true` flags when running the Event Store executable.
