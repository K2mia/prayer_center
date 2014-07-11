module ApplicationHelper

  def pass_helper( pass )
     return '******'
  end

  def full_title(ptitle)
    base_title = "Prayer Center"
    if ptitle.empty?
      base_title
    else
      "#{base_title} | #{ptitle}"
    end
  end

end
