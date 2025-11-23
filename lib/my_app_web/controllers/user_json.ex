defmodule MyAppWeb.UserJSON do
  alias MyApp.Account.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  def sign_in(%{user: user}) do
    %{data: %{user: %{id: user.id, email: user.email}}}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      email: user.email,
      is_active: user.is_active
    }
  end
end
