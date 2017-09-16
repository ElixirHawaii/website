defmodule Exhi.Article do
  use ExhiWeb, :model

  schema "articles" do
    field :title, :string
    field :content, :string
    field :blurb, :string

    timestamps()
  end

  def changeset(article, params \\ %{}) do
    article
    |> cast(params, [:title, :content])
  end
end
