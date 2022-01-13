defmodule Marvin.Bot.Commands do
  alias Marvin.Bot.Utils

  @greetings ~w(gugus hey hallo hi)

  def greet_user(msg, token) do
    c_id = Utils.get_chat_id!(msg)
    f_name = Utils.get_first_name!(msg)

    resp = "#{Enum.random(@greetings)} #{f_name}!"

    Telegram.Api.request(token, "sendMessage", chat_id: c_id, text: resp)
  end

  @marvin_quotes [
    "I think you ought to know I'm feeling very depressed.",
    "I'm not getting you down at all am I",
    "I've seen it. It's rubbish.",
    ~s"""
    Now the world has gone to bed
    Darkness won't engulf my head
    I can see by infra-red
    How I hate the night
    Now I lay me down to sleep
    Try to count electric sheep
    Sweet dream wishes you can keep
    How I hate the night
    """,
    "You watch this door. It's about to open again. I can tell by the intolerable air of smugness it suddenly generates."
  ]

  def quote_marvin(msg, token) do
    c_id = Utils.get_chat_id!(msg)

    resp = "#{Enum.random(@marvin_quotes)}"

    Telegram.Api.request(token, "sendMessage", chat_id: c_id, text: resp)
  end
end
