defmodule ExhiWeb.Router do
  use ExhiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExhiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/articles", ArticleController, :index
    get "/articles/new", ArticleController, :new
    get "/articles/:id", ArticleController, :show
    get "/articles/:id/edit", ArticleController, :edit
    put "/articles/:id", ArticleController, :update
    post "/articles", ArticleController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExhiWeb do
  #   pipe_through :api
  # end
end
