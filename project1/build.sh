#!/bin/bash

# javac GetWebpage.java
# java GetWebpage http://stackoverflow.com

echo '---------- Preprocessing ----------'
javac ParseJSON.java
java ParseJSON


# TASK 2A:
echo '---------- TASK 2A ----------'
curl -H "Content-Type: application/json" -XPOST 'localhost:9200/task2a/wikipage/_bulk?pretty' --data-binary "@data/out.txt"


# echo 'Tests...'
# curl -s -XGET "localhost:9200/task2a/wikipage/1?pretty"
# curl -s -XGET "localhost:9200/task2a/wikipage/34261?pretty"
# curl -s -XGET "localhost:9200/task2a/wikipage/67380?pretty"
# curl -s -XGET "localhost:9200/task2a/wikipage/91872?pretty"
# curl -s -XGET "localhost:9200/task2a/wikipage/128604?pretty"



# TASK 2B:
echo '---------- TASK 2B ----------'
curl -XPUT 'localhost:9200/task2b?pretty' -H 'Content-Type: application/json' -d '
{
    "mappings": {
        "wikipage" : {
            "_all" : {
                "type" : "text", 
                "analyzer" : "whitespace"
            },
            "properties" : {
                "abstract" : {
                    "type" :    "text",
                    "analyzer": "whitespace"
                },
                "title" : {
                    "type" :   "text",
                    "analyzer": "whitespace"
                },
                "url": {
                    "type" :   "text",
                    "analyzer": "whitespace"
                },
                "sections": {
                    "type" :   "text",
                    "analyzer": "whitespace"
                }
            }
        }
    }
}'

curl -XPOST 'localhost:9200/task2b/wikipage/_bulk?pretty' --data-binary "@data/out.txt"

# echo 'Tests...'
# curl -s -XGET "localhost:9200/task2b/_search?q=information%20retrieval&pretty"
# curl -s -XGET "localhost:9200/task2b/_search?q=April%205&pretty"
# curl -s -XGET "localhost:9200/task2b/_search?q=the%20matrix&pretty"
# curl -s -XGET "localhost:9200/task2b/_search?q=algebra&pretty"



# TASK 2C:
echo '---------- TASK 2C ----------'
curl -XPUT 'localhost:9200/task2c?pretty' -H 'Content-Type: application/json' -d '
{
    "settings": {
        "analysis": {
            "analyzer": {
                "best_analyzer_in_the_universe": {
                    "type": "custom",
                    "char_filter": "html_strip",
                    "tokenizer": "standard",
                    "filter": [ "asciifolding", "lowercase", "stop", "snowball"]
                }
            }
        }
    },

    "mappings": {
        "wikipage" : {
            "_all" : {
                "type" : "text", 
                "analyzer" : "best_analyzer_in_the_universe"
            },
            "properties" : {
                "abstract" : {
                    "type" :    "text",
                    "analyzer": "best_analyzer_in_the_universe"
                },
                "title" : {
                    "type" :   "text",
                    "analyzer": "best_analyzer_in_the_universe"
                },
                "url": {
                    "type" :   "text",
                    "analyzer": "best_analyzer_in_the_universe"
                },
                "sections": {
                    "type" :   "text",
                    "analyzer": "best_analyzer_in_the_universe"
                }
            }
        }
    }
}'

curl -XPOST 'localhost:9200/task2c/wikipage/_bulk?pretty' --data-binary "@data/out.txt"

# echo 'Tests...'
# curl -s -XGET "localhost:9200/task2c/_search?q=information%20retrieval&pretty"
# curl -s -XGET "localhost:9200/task2c/_search?q=April%205&pretty"
# curl -s -XGET "localhost:9200/task2c/_search?q=the%20matrix&pretty"
# curl -s -XGET "localhost:9200/task2c/_search?q=algebra&pretty"
