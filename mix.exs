defmodule ExEasyPost.Mixfile do
  use Mix.Project

  @version "2.0.1"

  def project do
    [app: :ex_easypost,
     version: @version,
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package(),
     preferred_cli_env: [
       "coveralls": :test,
       "coveralls.html": :test,
       "coveralls.travis": :test
     ],
     test_coverage: [tool: ExCoveralls]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:hackney, "~> 1.0", optional: true},
      {:httpoison, "~> 0.12 or ~> 1.0", optional: true},
      {:poison, "~> 2.2 or ~> 3.0", optional: true},
      # dev
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      # test
      {:bypass, "~> 0.6", only: :test},
      {:excoveralls, "~> 0.7", only: :test, runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp package do
    [
      description: "Elixir client for the EasyPost API",
      files: ["lib", "config", "mix.exs", "README*"],
      maintainers: ["Anthony Smith"],
      licenses: ["MIT"],
      links: %{
        GitHub: "https://github.com/sticksnleaves/ex_easypost"
      }
    ]
  end
end
