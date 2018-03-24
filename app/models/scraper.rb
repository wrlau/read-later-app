class Scraper
  #guardian uk website
  #entries = div.fc-container__inner
  #first heading = entries[0].css('.fc-container__header__title>a span').text OR entries[0].css('.fc-container__header__title').css('span')[0].text

  #first link = entries[0].css('.fc-container__header__title>a')[0]['href']
end
