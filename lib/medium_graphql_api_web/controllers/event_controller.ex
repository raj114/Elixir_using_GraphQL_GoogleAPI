defmodule MediumGraphqlApiWeb.EventController do
  use MediumGraphqlApiWeb, :controller
  alias MediumGraphqlApi.Accounts
  def index(conn, _params) do
    users = []
    users ++ Accounts.list_users()
    json conn, users
  end

  def allData1 do
    lst1=[4, 5, 6]
    lst1
  end
end
