module DashboardHelper
  def get_min_page(page, max_number_of_pages)
    if page <= 4
      1
    elsif page >= (max_number_of_pages - 3)
      max_number_of_pages - 6
    else
      page - 3
    end
  end

  def get_min_and_max_pages(result, page, per_page)
    max_number_of_pages = (1.0 * [result[:total_count], 1000].min / per_page).ceil
    min_page = get_min_page(page, max_number_of_pages)
    max_page = min_page + 6
    return min_page, [max_page, max_number_of_pages].min, max_number_of_pages
  end
end