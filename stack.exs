defmodule Stack do
  use GenServer

  # Callbacks

  def handle_call(:pop, _from, [h | t]) do
   IO.puts "server call"
   {:reply, h, t}
   #{:noreply,t}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end

# Start the server
{:ok, pid} = GenServer.start_link(Stack, ["你好"])

# This is the client
msg=GenServer.call(pid, :pop)
IO.puts msg
#=> :hello

GenServer.cast(pid, {:push, :world})
#=> :ok

IO.puts GenServer.call(pid, :pop)
#=> :world