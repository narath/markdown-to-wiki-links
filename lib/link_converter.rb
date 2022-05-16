class LinkConverter

  REGEXMDLINKS = /\[(.+?)\]\((.*?)\)/
  REGEDIMAGELINKS = /!\[(.+?)\]/

  def self.convert(lines)
    lines
      .gsub(REGEXMDLINKS, '[\2 \1]')
      .gsub(REGEDIMAGELINKS, '[File:\1]')
  end

end

