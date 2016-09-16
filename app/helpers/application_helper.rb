module ApplicationHelper
	def country_flag(country_name, width)
		image_tag("/flag/65x65/flag_#{country_name}.png", style: :"width:#{width}%;display:inline;" )
	end
end
