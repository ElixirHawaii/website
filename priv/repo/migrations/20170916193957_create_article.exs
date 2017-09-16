defmodule Exhi.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :content, :text
      add :blurb, :string

      timestamps()
    end
  end
end
