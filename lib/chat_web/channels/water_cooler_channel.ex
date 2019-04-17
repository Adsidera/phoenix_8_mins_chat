defmodule ChatWeb.WaterCoolerChannel do
  use ChatWeb, :channel

  alias Chat.Chats

  def join("water_cooler:lobby", payload, socket) do
    {:ok, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the clien

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (water_cooler:lobby).
  def handle_in("shout", payload, socket) do
    Chats.create_message(payload)
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end
end
