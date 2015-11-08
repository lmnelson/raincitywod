module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def duplicateWod?(thisWod, lastWod)
    thisWod == lastWod
  end

end
