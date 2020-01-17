defmodule ExAws.MediaLive do
  # Input Security Groups

  def list_input_security_groups(params \\ []) do
    request(:get, "/prod/inputSecurityGroups", params: params)
  end

  def create_input_security_group(data) do
    request(:post, "/prod/inputSecurityGroups", data: data)
  end

  def describe_input_security_group(input_security_group_id) do
    request(:get, "/prod/inputSecurityGroups/#{input_security_group_id}")
  end

  def update_input_security_group(input_security_group_id, data) do
    request(:put, "/prod/inputSecurityGroups/#{input_security_group_id}", data: data)
  end

  def delete_input_security_group(input_security_group_id) do
    request(:delete, "/prod/inputSecurityGroups/#{input_security_group_id}")
  end

  # Inputs

  def list_inputs(params \\ []) do
    request(:get, "/prod/inputs", params: params)
  end

  def create_input(data) do
    request(:post, "/prod/inputs", data: data)
  end

  def describe_input(input_id) do
    request(:get, "/prod/inputs/#{input_id}")
  end

  def update_input(input_id, data) do
    request(:put, "/prod/inputs/#{input_id}", data: data)
  end

  def delete_input(input_id) do
    request(:delete, "/prod/inputs/#{input_id}")
  end

  # Channels

  def list_channels(params \\ []) do
    request(:get, "/prod/channels", params: params)
  end

  def create_channel(data) do
    request(:post, "/prod/channels", data: data)
  end

  def describe_channel(channel_id) do
    request(:get, "/prod/channels/#{channel_id}")
  end

  def update_channel(channel_id, data) do
    request(:put, "/prod/channels/#{channel_id}", data: data)
  end

  def delete_channel(channel_id) do
    request(:delete, "/prod/channels/#{channel_id}")
  end

  def start_channel(channel_id) do
    request(:post, "/prod/channels/#{channel_id}/start")
  end

  def stop_channel(channel_id) do
    request(:post, "/prod/channels/#{channel_id}/stop")
  end

  # Private

  defp request(method, path, args \\ []) do
    ExAws.Operation.JSON.new(:medialive, %{
      http_method: method,
      path: path,
      data: args |> Keyword.get(:data, []) |> normalize_data(),
      params: args |> Keyword.get(:params, %{}) |> normalize_params(),
      service: :medialive
    })
  end

  defp normalize_params(params) do
    ExAws.Utils.camelize_keys(params)
  end

  defp normalize_data("" = data), do: data
  defp normalize_data([]), do: ""

  defp normalize_data(data) do
    data
    |> Enum.into(%{})
    |> ExAws.Utils.camelize_keys()
  end
end
