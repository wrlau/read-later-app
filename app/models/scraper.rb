class Scraper


  #main page: doc = Nokogiri::HTML(open("https://www.theguardian.com/us"))
  #categories: categories = doc.css('li.pillars__item')
  #categories.length = 5 (news, opinion, sport, culture, lifestyle)
  #first category = categories[0].css('a').text.strip
  #first link = categories[0].css('a')[0]['href']

  #this will print out each category and link
  categories.each do |category|
    puts category.css('a').text.strip
    puts category.css('a')[0]['href']
  end

end
