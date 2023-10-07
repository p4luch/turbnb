defmodule TurbnbWeb.LandingLive do
  use TurbnbWeb, :live_view

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Welcome to TurBnB</h1>
    """
  end
end
