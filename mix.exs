defmodule ExAws.MediaLive.MixProject do
  use Mix.Project

  @repo_url "https://github.com/grain-team/ex_aws_medialive"

  def project do
    [
      app: :ex_aws_medialive,
      version: "0.2.0",
      elixir: "~> 1.9",
      description: "ExAws.MediaLive service package",
      source_url: @repo_url,
      package: [
        maintainers: ["Ryan Johnson"],
        licenses: ["MIT"],
        links: %{
          "Github" => @repo_url,
          "Made by Grain" => "https://grain.co"
        }
      ],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:hackney, ">= 0.0.0", only: [:dev, :test]},
      {:poison, ">= 0.0.0", only: [:dev, :test]},
      {:ex_aws, "~> 2.0"}
    ]
  end
end
