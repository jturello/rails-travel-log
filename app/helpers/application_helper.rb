module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    binding.pry
    direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    binding.pry
    link_to title, sort: column, direction: direction
  end
end
