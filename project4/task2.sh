#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "usage: task2.sh <corpus dir> <number of topics>"
    exit 1
fi

INPUT_DIR=$1
NUM_TOPICS=$2
MALLET_TEMP=temp.mallet
TOPIC_WORDS=topic-words.txt
DOC_TOPICS=doc-topics.txt

mallet import-dir --input $INPUT_DIR --output $MALLET_TEMP --keep-sequence --remove-stopwords
mallet train-topics --input $MALLET_TEMP --num-topics $NUM_TOPICS --output-topic-keys $TOPIC_WORDS --output-doc-topics $DOC_TOPICS
rm $MALLET_TEMP

