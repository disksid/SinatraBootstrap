# coding: utf-8

module MyAppHelper
  def d(date, format = '%Y/%m/%d (%a) %H:%M:%S')
    return '' unless date
    date.strftime(format)
  end
end
