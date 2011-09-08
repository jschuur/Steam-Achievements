module ApplicationHelper
	def sparkline_tag(results=[], options={})		
    attributes = %(class="#{options[:class] || 'sparkline'}" alt="Sparkline Graph" )
    attributes << %(title="#{options[:title]}" ) if options[:title]

    attributes << %(width="#{options[:width]}" ) if options[:width] 
  	attributes << %(height="#{options[:height]}" )  if options[:height]

    data_url = "data:image/png;base64,#{Base64.encode64(Sparklines.plot(results,options))}"
    tag = raw %(<img src="#{data_url}" #{attributes}/>)
	end
end
