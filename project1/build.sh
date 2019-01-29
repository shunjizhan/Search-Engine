#!/bin/bash

# javac GetWebpage.java
# java GetWebpage http://stackoverflow.com



# TASK 2A:
echo '---------- TASK 2A ----------'
echo 'Preprocessing data...'
javac ParseJSON.java
java ParseJSON

echo 'Generating indexes...'
curl -H "Content-Type: application/json" -XPOST 'localhost:9200/task2a/wikipage/_bulk?pretty' --data-binary "@data/out.txt"

echo 'Tests...'
curl -s -XGET "localhost:9200/task2a/wikipage/1?pretty"
# curl -s -XGET "localhost:9200/task2a/wikipage/34261?pretty"
# curl -s -XGET "localhost:9200/task2a/wikipage/67380?pretty"
# curl -s -XGET "localhost:9200/task2a/wikipage/91872?pretty"
# curl -s -XGET "localhost:9200/task2a/wikipage/128604?pretty"



# TASK 2B:
# Create and index with a whitespace analyzer




# TASK 2C:
# Create and index with a custom analyzer as specified in Task 2C




