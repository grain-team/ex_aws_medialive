defmodule ExAws.MediaLive.Utils do
  # ExAws.Utils.camelize_keys actually outputs PascalCase, not camelCase...

  def camelize_keys(map) when is_map(map) do
    Map.new(map, fn {k, v} ->
      {camelize(k), camelize_value(v)}
    end)
  end

  def camelize_keys(list) when is_list(list) do
    Enum.map(list, &camelize_value/1)
  end

  defp camelize(atom) when is_atom(atom) do
    atom |> Atom.to_string() |> camelize()
  end

  defp camelize(string) when is_binary(string) do
    # Macro.camelize should be safe given the limited keys used in the API
    <<char::utf8, rest::binary>> = Macro.camelize(string)
    String.downcase(<<char::utf8>>) <> rest
  end

  defp camelize_value(enum) when is_map(enum) or is_list(enum) do
    camelize_keys(enum)
  end

  defp camelize_value(other), do: other
end
