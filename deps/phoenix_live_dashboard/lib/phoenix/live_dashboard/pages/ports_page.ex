defmodule Phoenix.LiveDashboard.PortsPage do
  @moduledoc false
  use Phoenix.LiveDashboard.PageBuilder

  alias Phoenix.LiveDashboard.SystemInfo
  import Phoenix.LiveDashboard.Helpers

  @menu_text "Ports"

  @impl true
  def render(assigns) do
    ~H"""
    <.live_table
      id="ports-table"
      dom_id="ports-table"
      page={@page}
      title="Ports"
      row_fetcher={&fetch_ports/2}
      row_attrs={&row_attrs/1}
    >
      <:col field={:port} :let={data}>
        <%= data[:port] |> encode_port() |> String.trim_leading("Port") %>
      </:col>
      <:col field={:name} header="Name or path" :let={data}>
        <%= format_path(data[:name]) %>
      </:col>
      <:col
        field={:os_pid}
        header="OS pid"
        :let={data}
      >
        <%= if data[:os_pid] != :undefined, do: data[:os_pid] %>
      </:col>
      <:col field={:input} text_align="right" sortable={:desc} :let={data}>
        <%= format_bytes(data[:input]) %>
      </:col>
      <:col field={:output} text_align="right" sortable={:desc} :let={data}>
        <%= format_bytes(data[:output]) %>
      </:col>
      <:col field={:id} text_align="right"/>
      <:col field={:owner} :let={data}>
        <%= inspect(data[:owner]) %>
      </:col>
    </.live_table>
    """
  end

  defp fetch_ports(params, node) do
    %{search: search, sort_by: sort_by, sort_dir: sort_dir, limit: limit} = params

    SystemInfo.fetch_ports(node, search, sort_by, sort_dir, limit)
  end

  defp row_attrs(port) do
    [
      {"phx-click", "show_info"},
      {"phx-value-info", encode_port(port[:port])},
      {"phx-page-loading", true}
    ]
  end

  @impl true
  def menu_link(_, _) do
    {:ok, @menu_text}
  end
end
