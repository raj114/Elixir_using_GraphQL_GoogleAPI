defmodule MediumGraphqlApiWeb.UserController do
  use MediumGraphqlApiWeb, :controller
  alias MediumGraphqlApi.Accounts
  def index(conn, _params) do
    users = []
    users ++ Accounts.list_users()
    json conn, users
  end

  def allData do
    lst=[1, 2, 3]
    lst
  end
end
