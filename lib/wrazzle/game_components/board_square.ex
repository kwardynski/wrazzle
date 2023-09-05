defmodule Wrazzle.GameComponents.BoardSquare do
  @moduledoc false

  defstruct [
    :index,
    :row,
    :column,
    :tile,
    :bonus
  ]

  @type bonus_types() :: :double_letter | :triple_letter | :double_word | :triple_word

  @type t() :: %__MODULE__{
    index: integer(),
    row: integer(),
    column: integer(),
    tile: Tile.t() | nil,
    bonus: bonus_types() | nil
  }

  def new(index, row, column, bonus \\ nil) do
    %__MODULE__{
      index: index,
      row: row,
      column: column,
      tile: nil,
      bonus: bonus
    }
  end

  def add_bonus(%__MODULE__{} = board_square, bonus), do: %{board_square | bonus: bonus}
end
