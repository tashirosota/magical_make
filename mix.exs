defmodule MagicalMake.MixProject do
  use Mix.Project
  @versoin "0.1.0"
  # @source_url "https://github.com/tashirosota/magical_make"
  # @description "A cool tool to decorate your makeup commands with Magic Circle"

  def project do
    [
      app: :magical_make,
      version: @versoin,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
      # TODO: 挙動確認
      # # docs
      # description: @description,
      # name: "MagicalMake",
      # source_url: @source_url,
      # docs: [
      #   main: "readme",
      #   source_url: @source_url,
      #   extras: [
      #     "README.md"
      #   ]
      # ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp escript do
    [main_module: MagicalMake.CLI, name: :mgc]
  end

  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
