defmodule ExhiWeb.PageController do
  use ExhiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
