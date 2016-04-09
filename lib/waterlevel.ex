defmodule LakeData.WaterLevel do
	@moduledoc """
	Functions that relate to the water level at Lake Sara.
	"""
	@doc """
	Generates Lake Data based on measured parameters.

	Given a dock measurement and a water temperature measurement, the parameters for sending to the Lake Sara website are generated.

	The calculation for the water level ASL is: 581.72-(dock+3.0)/12.0
	"""
	def water_level_from_dock (dock) do
		waterlevel = 581.72-(dock+3.0)/12.0
#		IO.puts "Lake Level: " <> to_string(waterlevel)
	end
end
