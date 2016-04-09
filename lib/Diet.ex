defmodule Diet do
	@config [{:weighttarget, 192.0},
			 {:weightstart, 222.0},
			 {:datestart, {2016,1,5}},
			 {:targetdays, 90.0}]
	@doc """
	Generates my diet tag each day given the recorded weight.

	This tag is stated 	in a format that kind of resembles a weather data string.

		20160107:221.0-01.0+00.3

		[date]:[weight][change][compliance]
	"""
	def gen_diettag (weight) do

		{today,_} = :os.timestamp |> :calendar.now_to_datetime
		{year,month,day} = today

		daycount = :calendar.date_to_gregorian_days(today) - :calendar.date_to_gregorian_days(@config[:datestart])

#		change = weight - @weightstart
		change = weight - @config[:weightstart]
		{changesign, changemag} = split_sign_value change
		compliance = (@config[:weightstart] - (@config[:weightstart] - @config[:weighttarget]) / @config[:targetdays] * daycount) - weight
		{compliancesign, compliancemag} = split_sign_value compliance

 		to_string(:io_lib.format("~4w~2..0w~2..0w:~5.1f~1s~4.1.0f~1s~4.1.0f", [year,month,day,weight, changesign,changemag, compliancesign,compliancemag]))
	end

	def split_sign_value(f) when f<0, do: {'-',abs f}
	def split_sign_value(f), do: {'+',f}
end
