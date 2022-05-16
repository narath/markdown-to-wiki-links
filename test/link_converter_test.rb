require "minitest/autorun"
require_relative "../lib/link_converter"

class LinkConverterTest < Minitest::Test

  def test_can_convert_simple_links
    contents = <<ENDTEXT
Regular link
-   [SCORE Curriculum](https://www.surgicalcore.org/login)
ENDTEXT
    expected = <<ENDTEXT
Regular link
-   [https://www.surgicalcore.org/login SCORE Curriculum]
ENDTEXT
    assert_equal expected, LinkConverter.convert(contents)
  end

  def test_can_convert_multiple_links_per_line
    contents = <<ENDTEXT
A. Rotation/Call Schedule:  [Another link](https://cpd.partners.org/modules/file/icons/x-office-spreadsheet.png "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") [2021-2022 General Surgery Resident Rotation Schedule](https://cpd.partners.org/sites/default/files/2021.xlsx)
ENDTEXT
expected = <<ENDTEXT
A. Rotation/Call Schedule:  [https://cpd.partners.org/modules/file/icons/x-office-spreadsheet.png \"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet\" Another link] [https://cpd.partners.org/sites/default/files/2021.xlsx 2021-2022 General Surgery Resident Rotation Schedule]
ENDTEXT
    assert_equal expected, LinkConverter.convert(contents)
  end

  def test_can_convert_show_image_links
    contents = <<ENDTEXT
![File](https://cpd.partners.org/modules/file/icons/x-office-spreadsheet.png "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
ENDTEXT
    expected = <<ENDTEXT
[File:https://cpd.partners.org/modules/file/icons/x-office-spreadsheet.png "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" File]
ENDTEXT
    assert_equal expected, LinkConverter.convert(contents)
  end
end



