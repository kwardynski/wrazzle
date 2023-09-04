defmodule Wrazzle.GameComponents.Tile do
  @moduledoc false

  defstruct [:letter, :value]

  @type t() :: %__MODULE__{
          letter: String.t(),
          value: integer()
        }

  def new(letter, value) do
    %__MODULE__{
      letter: letter,
      value: value
    }
  end
end
