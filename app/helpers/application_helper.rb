module ApplicationHelper
  def previous_path(current_path)
    if current_path
      prev = current_path.rindex('.') ? current_path.rindex('.') - 1 : -1
      return 'root' if prev == -1

      current_path.slice(0..prev)
    else
      'root'
    end
  end
end
