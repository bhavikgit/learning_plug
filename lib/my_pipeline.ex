defmodule MyPipeline do

	use Plug.Builder

	plug Plug.Logger
	plug :extract_name
	plug :greet, %{my_options: "Hi"}

	def extract_name(%Plug.Conn{request_path: "/" <> name} = conn, opts) do
		assign(conn,:name,name)
	end

	def greet(conn,opts) do
		conn
		|> send_resp(200,"#{opts[:my_options]}, #{conn.assigns.name}")
	end
end