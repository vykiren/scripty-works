import requests
import urllib.request
import time
from bs4 import BeautifulSoup
import re
import tkinter as tk
from tkinter import *
from tkinter import simpledialog

root = tk.Tk()
root.withdraw()

site = simpledialog.askstring(title="Footwork", prompt="Enter Website Address")

words = ['cloud', 'PDF', 'create']
url = site
res = requests.get(url)
html_page = res.content
soup = BeautifulSoup(html_page, 'html.parser')

blacklist = [
    'noscript',
    'header',
    'html',
    'meta',
    'head',
    'input',
    'script'
    ]

def notBlacklist(tag):
    for item in blacklist:
        if tag.has_attr(item):
            return False
    return True

text = soup.find_all(notBlacklist, text=True)

for tag in text:
    for item in tag.descendants:
        if item.name not in blacklist and tag.name not in blacklist:
            contains = []
            for word in words:
                if word.lower() in item.string.lower():
                    contains.append(word)
            if contains:
                print("Found " + ', '.join(contains) + " in line " + str(tag.name) + " " + str(tag.sourceline) + ": \t" + item.string)