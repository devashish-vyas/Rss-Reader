require_relative 'rssManager.rb'
require_relative 'rssData.rb'


class App

    def Run

        rssUrl = "http://feeds.feedburner.com/rockpapershotgun?format=xml"

        rssManager=RssManager.new

        rssChannel=rssManager.loadRssChannel(rssUrl)

        puts rssChannel.Title
        puts rssChannel.Description
        puts rssChannel.Link
        puts rssChannel.PubDate

        for index in 0..rssChannel.RssItems.length-1 do
            puts rssChannel.RssItems[index].Title
            puts rssChannel.RssItems[index].Description
            puts rssChannel.RssItems[index].Link
            puts rssChannel.RssItems[index].Guid
            puts rssChannel.RssItems[index].PubDate
        end
    end
end

app=App.new
app.Run


        
