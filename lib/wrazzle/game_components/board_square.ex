defmodule Wrazzle.GameComponents.BoardSquare do
  defstruct [
    :index,
    :row,
    :column,
    :occupied,
    :bonus
  ]

  @type t() :: %__MODULE__{
    index: integer(),
    row: integer(),
    column: integer(),
    occupied: boolean(),
    bonus: atom()
  }

  def new(index, row, column, bonus \\ nil) do
    %__MODULE__{
      index: index,
      row: row,
      column: column,
      occupied: false,
      bonus: bonus
    }
  end



end
