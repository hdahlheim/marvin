defmodule Marvin.Bot do
  @behaviour Telegram.ChatBot

  alias Marvin.Bot.Commands, as: Cmd

  @impl Telegram.ChatBot
  def init() do
    {:ok, %{}}
  end

  @impl Telegram.ChatBot
  def handle_update(%{"message" => %{"text" => text}} = msg, token, state)
      when text in ["gugus", "Gugus"] do
    Cmd.greet_user(msg, token)

    {:ok, state}
  end

  def handle_update(%{"message" => %{"text" => "/quote"}} = msg, token, state) do
    Cmd.quote_marvin(msg, token)

    {:ok, state}
  end

  @impl Telegram.ChatBot
  def handle_update(msg, _token, state) do
    IO.inspect({msg, state})

    {:ok, state}
  end
end
