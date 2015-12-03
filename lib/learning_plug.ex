defmodule LearningPlug do

	import Plug.Conn

	def init(opts) do
		Map.put(opts,:my_options,"Hello")
	end

	def call(conn,opts) do
		send_resp(conn,200,"#{opts[:my_options]} World ")
	end
end
