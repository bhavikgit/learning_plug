defmodule LearningPlug do

	import Plug.Conn

	def init(opts) do
		Map.put(opts,:my_options,"Hello")
	end

	def call(%Plug.Conn{request_path: "/" <> name} = conn,opts) do
		send_resp(conn,200,"Hello, #{name} ")
	end
end
