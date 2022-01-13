defmodule Marvin.Config do
  use Vapor.Planner

  dotenv()

  config :telegram,
         env([
           {:token, "TELEGRAM_BOT_TOKEN"}
         ])
end
