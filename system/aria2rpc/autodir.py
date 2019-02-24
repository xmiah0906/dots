 #!/usr/bin/python2
# -*- coding: utf-8 -*-

from urlparse import urlparse
from os.path import splitext
from os import getenv
import re
import logging

logging.basicConfig(filename='/tmp/aria2rpc.log', format='%(asctime)s: %(message)s', level=20)

def get_ext(url):
    """Return the filename extension from url, or ''."""
    parsed = urlparse(url)
    root, ext = splitext(parsed.path)
    return ext[1:]  # or ext[1:] if you don't want the leading '.'

def autodir(URL):
    subdir = {
        "general": getenv("HOME"),
        "png|jpg" :  "/Imagens",
        "mp4|mkv" : "/Medi",
        "mp3|m4a" : "/Medi",
        "pdf" : "/Downloads",
        "iso" : "/Downloads/ISO",
        "zip|rar|7z|tar|gz" : "/Downloads"
        }

    filetype = get_ext(URL) or "general"
    saveto = subdir["general"]

    print ('filetype: ' + filetype)
    for k,v in subdir.items()[1:]:
        if filetype.lower() in k:
            saveto +=  subdir[k]
            break

    logging.info( URL + ' -> ' + saveto)

    return saveto
