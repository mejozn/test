defmodule Gserver do
    use GenServer
    def handle_call(:pop,_from,[h|t]=state)  do
        {:reply,h,t}
    end

    def handle_cast({:push,item},state) do
        {:noreply,[state|item]}
    end
end
