require 'net/http'
require 'nokogiri'
require 'open-uri'

previous = ""
timeout = ARGV[0]
timeout = 5 if !timeout

while true do
  woot = Nokogiri::HTML(open('http://www.woot.com'))
  woot.xpath('//*[@id="summary"]/div/hgroup/a/h2').each do |t|
        if previous != t.content
            previous = t.content
            puts t.content
            `beep`
        end
  end
  sleep timeout
end
