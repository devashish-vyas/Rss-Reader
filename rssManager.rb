require 'open-uri'
require 'nokogiri'
require_relative 'rssData.rb'



class RssManager

  def loadRssChannel(rssUrl)
    
      # Read Rss from url(using nokogiri library)
      xmlDoc= Nokogiri::XML(URI.open(rssUrl))
      #get Rss Channel node
      rssChannelNode = xmlDoc.root.at_xpath("channel")

      rssChannel = RssChannel.new


      # Created new Rss channel
      rssChannel.Title =  xmlDoc.root.at_xpath("channel/title").content

      if rssChannelNode.at_xpath("description")
        rssChannel.Description=rssChannelNode.at_xpath("description").content
      end

      if rssChannelNode.at_xpath("link")
        rssChannel.Link=rssChannelNode.at_xpath("link").content
      end

      if rssChannelNode.at_xpath("pubDate")
        rssChannel.PubDate=rssChannelNode.at_xpath("pubDate").content
      end

      rssChannel.RssItems=loadRssItems(rssUrl)

      return rssChannel

  end


  def loadRssItems(rssUrl)

      # read Rss from URL
      xmlDoc= Nokogiri::XML(URI.open(rssUrl))

      #Get Xml nodes
      rssItemNodes = xmlDoc.root.xpath("channel/item")

      rssItems=[]
      
      for index in 0..rssItemNodes.length-1 do
          #Created new RssItem
          rssitem=RssItem.new

          rssitem.Title=rssItemNodes[index].at_xpath("title").content

          if rssItemNodes[index].at_xpath("description")
            rssitem.Description=rssItemNodes[index].at_xpath("description").content 
          end

          if rssItemNodes[index].at_xpath("link")
            rssitem.Link=rssItemNodes[index].at_xpath("link").content
          end

          if rssItemNodes[index].at_xpath("guid")
              rssitem.Guid=rssItemNodes[index].at_xpath("guid").content
          end

          if rssItemNodes[index].at_xpath("pubDate")
             rssitem.PubDate=rssItemNodes[index].at_xpath("pubDate").content
          end
          
          #adding new rssItem to an array
          rssItems.push(rssitem);
      end
      

    return rssItems
    
  end

end



