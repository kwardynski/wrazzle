export_locals_without_parens = [
  plug: 1,
  plug: 2,
  socket: 2
]

[
  import_deps: [:ecto, :phoenix, :plug],
  inputs:
    ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"] --
      ["lib/wrazzle_web/core_components.ex", "lib/wrazzle_web/layouts.ex"]
]
