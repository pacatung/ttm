module ApplicationHelper
	def country_flag(country_name, width)
		image_tag("/flag/65x65/flag_#{country_name}.png", style: :"width:#{width};display:inline;margin-bottom:3px;" )
	end
	def setup_post(post)
		post.countries.build if post.countries.blank?
		post
	end
end
