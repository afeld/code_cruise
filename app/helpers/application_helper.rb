module ApplicationHelper
  def resource_path(resource)
    topic_resource_path resource.topic, resource
  end

  def edit_resource_path(resource)
    edit_topic_resource_path resource.topic, resource
  end
end
