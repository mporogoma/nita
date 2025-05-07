module ApplicationHelper
  def format_date(date)
    date.strftime('%b %d, %Y')
  end

  def date_range_display(start_date, end_date)
    if start_date.to_date == end_date.to_date
      start_date.to_date.strftime('%B %d, %Y')
    else
      "#{start_date.to_date.strftime('%b %d')} - #{end_date.to_date.strftime('%b %d, %Y')}"
    end
  end

  def stock_status_class(quantity, threshold)
    if quantity <= threshold
      'text-red-600 font-bold'
    else
      'text-gray-500'
    end
  end
end
