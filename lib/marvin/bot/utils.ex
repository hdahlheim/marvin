defmodule Marvin.Bot.Utils do
  def get_first_name(msg) do
    Enum.find_value(msg, fn
      {_, %{"chat" => %{"first_name" => first_name}}} ->
        {:ok, first_name}

      _ ->
        nil
    end)
  end

  def get_first_name!(msg) do
    {:ok, first_name} = get_first_name(msg)
    first_name
  end

  def get_chat_id(msg) do
    Telegram.Bot.Utils.get_chat_id(msg)
  end

  def get_chat_id!(msg) do
    {:ok, id} = Telegram.Bot.Utils.get_chat_id(msg)
    id
  end
end
