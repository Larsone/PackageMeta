# Android Package Metadata
This script accepts a csv file of format:
Count,PackageName

And scrapes the Google Play Sotre of surrounding meta-data on each package, producing an output in JSON that can be loaded into ElasticSearch

# Requirements
* Ruby 2.3.x >
* gem market_bot -- command: 'gem install market_bot'

# Command
    ruby market.tb <fileIn> > <fileOut>

    e.g.
    ruby market.rb counts.csv > output.json

# ElasticSearch Schema Command
These commands will add a valid index and schema to ElasticSearch

    curl -XPUT 'http://localhost:9200/android'

    curl -XPUT 'http://localhost:9200/android/_mapping/app' -d '{"app": {"properties": {"title": {"type": "string","index": "not_analyzed"},"price": {"type": "string","index": "not_analyzed"},"installs": {"type": "string","index": "not_analyzed"},"category": {"type": "string","index": "not_analyzed"},"description": {"type": "string"},"error": {"type": "string","index": "not_analyzed"},"count": {"type": "integer"}}}}
