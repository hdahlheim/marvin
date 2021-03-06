defmodule Marvin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    config = Vapor.load!(Marvin.Config)

    IO.inspect(config)

    children = [
      {Telegram.Bot.ChatBot.Supervisor, {Marvin.Bot, config.telegram.token, []}}
      # Starts a worker by calling: Marvin.Worker.start_link(arg)
      # {Marvin.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Marvin.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
