module ViewHelpers
  

  # Date Helpers

  def created_at_title
    self[:created_at].localtime.strftime("%A, %b %-e, %Y at %l:%M%P")
  end

  def created_at_short_title
    self[:created_at].localtime.strftime("%b %-e, %Y at %l:%M%P")
  end

  def short_date(d)
    d.localtime.strftime("%l:%M%P %b %-e, %Y")
  end

  def updated_at_short
    short_date(self[:updated_at])
  end

  def created_at_short
    short_date(self[:created_at])
  end



  # Markdown Helpers

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :hard_wrap => true)
    #options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    markdown.render(text).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end

  def markdown_body
    markdown(self[:body])
  end

end
