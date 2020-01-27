defmodule MediumGraphqlApiWeb.MainController do
  use MediumGraphqlApiWeb, :controller

  def index(conn, _params) do
    main = []
    users = MediumGraphqlApiWeb.UserController.allData()
    data = users ++ main
    users1 = MediumGraphqlApiWeb.EventController.allData1()
    data1 = users1 ++ data
    json conn, data1

  end

end
