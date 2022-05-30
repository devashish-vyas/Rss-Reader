require_relative 'rssManager.rb'
require_relative 'rssData.rb'


DEFAULT_FEEDS=['https://kotaku.com/rss','http://goodbeerhunting.com/sightlines?format=RSS','http://feeds.feedburner.com/rockpapershotgun?format=xml']

def listselection(input)

    
    if input.to_i.to_s == input and input.to_i > 0 and input.to_i <= DEFAULT_FEEDS.length 
         
        rssUrl=DEFAULT_FEEDS[input.to_i - 1]
        feed(rssUrl)
        Run2()
    


    elsif input=='list'
        showdefaultfeeds
    
    elsif input.start_with?('http')
        rssUrl=input
        feed(rssUrl)
        Run2()
    elsif input=='exit'
        puts "Thanks"
    
    else
        puts "Please enter a Valid URL"
        Run2()
    end

end

def showdefaultfeeds
    puts "Enter the feed number to view article"
    DEFAULT_FEEDS.each_with_index do |feed,index|
        puts "#{index+1}. #{feed}"
    end
    listinput()
end

def listinput
    puts 'Enter a feed URL or select one of the default feeds by number (type "list" to see feeds)'
    puts "Type exit to end the process"
    input=gets.chomp
    listselection(input)
end

def feed(rssUrl)

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

def Run2
    puts "Enter another URL or write the index of the url from default feeds"
    puts "Type exit to end the process"
    DEFAULT_FEEDS.each_with_index do |feed,index|
        puts "#{index+1}. #{feed}"
    end

    input=gets.chomp
    listselection(input)

end


def Run
    #rssUrl = "http://feeds.feedburner.com/rockpapershotgun?format=xml"

    
    puts "Welcome to RSS "
    puts "You can enter the URL or you can select URL from some default feed (type list to see feeds)"
    puts "Type exit to end the process"
    input = gets.chomp
    listselection(input)


    
end


Run()

        
