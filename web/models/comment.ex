defmodule BlogPhoenix.Comment do
  use BlogPhoenix.Web, :model

  schema "comments" do
    field :name, :string
    field :content, :string
    belongs_to :post, BlogPhoenix.Post, foreign_key: :post_id

    timestamps()
  end

  @required_fields ~w(name content post_id)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  # def changeset(struct, params \\ %{}) do
  #   struct
  #   |> cast(params, [:name, :content])
  #   |> validate_required([:name, :content])
  # end
  
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :content, :post_id])
    |> validate_required([:name, :content, :post_id])
  end
end
