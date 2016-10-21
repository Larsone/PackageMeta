require 'market_bot'
require 'json'


file = File.open(ARGV[0])

def parse(line)
        lines = line.split(',')
        package = lines[1].strip
        count = lines[0].strip

	hash = {}
	hash["package"] = package
        hash["count"] = count


	begin

	        app = MarketBot::Play::App.new(package)
        	app.update

	        hash["title"] = app.title
	        hash["price"] = app.price
	        hash["installs"] = app.installs
	        hash["category"] = app.category
	        hash["description"] = app.description

	rescue MarketBot::NotFoundError
	
	rescue MarketBot::UnavailableError
		hash["error"] = "Not available in US"
	end

	puts JSON.generate(hash)


end

file.each do |line|

        lines = line.split(',')
        package = lines[1].strip
        count = lines[0].strip

        parse(line)
end

