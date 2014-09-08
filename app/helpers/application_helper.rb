module ApplicationHelper
	def resource_name
    :member
  end
 
  def resource
    @resource ||= member.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:member]
  end
  
end
