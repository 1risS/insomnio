#!/usr/bin/env python3
import time
import sys
import json

with open("postBigDict.json") as f:
    posts = json.load(f)
with open("thoughts.jsonl") as f:
    thoughts = json.load(f)

def type(text, speed=.04):
    for letter in text:
        sys.stdout.write(letter)
        time.sleep(speed)
        sys.stdout.flush()
    print()

def play_posts():
    for post in posts:
        datetime, post = post['datetime'], post['post']
        if post and datetime:
            print("[{}] {}".format(datetime, post))
            print()
            time.sleep(1)

def play_thoughts():
    for t in thoughts:
        type(t['datetime'])
        time.sleep(1)
        type(t['text'])

play_posts()
play_thoughts()
