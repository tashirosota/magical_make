defmodule MagicalMake.MixProject do
  use Mix.Project
  @versoin "0.1.0"
  @source_url "https://github.com/tashirosota/magical_make"
  @description "Decorate your make commands with Magic Circle"

  def project do
    [
      app: :magical_make,
      version: @versoin,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript(),
      description: @description,
      name: "MagicalMake",
      source_url: @source_url,
      package: package()
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

  defp package() do
    [
      licenses: ["Apache-2.0"],
      maintainers: ["Sota Tashiro"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp deps do
    [
      {:chisel, "~> 0.2.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
