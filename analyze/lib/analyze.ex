defmodule Analyze do
  @moduledoc """
  Documentation for `Analyze`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Analyze.hello()
      :world

  """
  def process(fname) do

    {:ok, cont} = File.read(fname)
    {:ok, d1} = Jason.decode(cont)
    {:ok, data} = Jason.decode(d1)

    airline=Enum.reduce(data,%{},fn k,acc -> Map.update(acc,k["airline"],1,fn x->x+1 end) end)
    {:ok,aar}=Jason.encode(airline,pretty: true)
    File.write!("../src/airline.json",aar)

    scity=Enum.reduce(data,%{},fn k,acc -> Map.update(acc,k["source_city"],1,fn x->x+1 end) end)
    {:ok,sar}=Jason.encode(scity,pretty: true)
    File.write!("../src/sourcecity.json",sar)
    
    dcity=Enum.reduce(data,%{},fn k,acc -> Map.update(acc,k["destination_city"],1,fn x->x+1 end) end)
    {:ok,dar}=Jason.encode(dcity,pretty: true)
    File.write!("../src/destcity.json",dar)

    duration=Enum.reduce(data,%{},fn k,acc -> Map.update(acc,k["duration"],1,fn x->x+1 end) end)
    {:ok,dur}=Jason.encode(duration,pretty: true)
    File.write!("../src/duration.json",dur)

    stops=Enum.reduce(data,%{},fn k,acc -> Map.update(acc,k["stops"],1,fn x->x+1 end) end)
    {:ok,stp}=Jason.encode(stops,pretty: true)
    File.write!("../src/stops.json",stp)
    
  end
end
