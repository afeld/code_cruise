module HomeHelper
  def pretty_alternate_titles(topic)
    list = topic.alternate_titles.map{|alt| "\"#{alt.title}\"" }
    output = list[0...-1].join(', ').presence
    [output, list.last].compact.join(' or ')
  end
end
