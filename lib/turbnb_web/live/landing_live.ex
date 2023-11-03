defmodule TurbnbWeb.LandingLive do
  use TurbnbWeb, :live_view

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="mx-auto">
      <h1 class="text-center font-extrabold text-4xl"><%= gettext("Welcome to TurBnB") %></h1>
    </div>
    """
  end
end
