defmodule ExhiWeb.ArticleController do
  use ExhiWeb, :controller

  def create(conn, _params) do
    changeset = Exhi.Article.changeset(%Exhi.Article{}, _params["article"])
    case Exhi.Repo.insert(changeset) do
      {:ok, _article} ->
        conn
        |> put_flash(:info, "Article saved.")
        |> redirect(to: article_path(conn, :index))
      {:error, _article} ->
          render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, _params) do
    article = Exhi.Article
            |> Exhi.Repo.get(_params["id"])
    changeset = Exhi.Article.changeset(article)
    render(conn, "edit.html", article: article, changeset: changeset)
  end

  def index(conn, _params) do
    articles = Exhi.Article
             |> Exhi.Repo.all

    render(conn, "index.html", articles: articles)
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def show(conn, _params) do
    article = Exhi.Article
            |> Exhi.Repo.get(_params["id"])
    render(conn, "show.html", article: article)
  end

  def update(conn, _params) do
    article = Exhi.Article
            |> Exhi.Repo.get(_params["id"])
    changeset = Exhi.Article.changeset(article, _params["article"])
    case Exhi.Repo.update(changeset) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article saved.")
        |> redirect(to: article_path(conn, :show, article))
      {:error, changeset} ->
        render(conn, "edit.html", article: article, changeset: changeset)
    end
  end
end
