#!/usr/bin/env python3
"""Copy files.

Usage:
  copy_files.py <share_link_url>
"""
import requests
import zipfile
import docopt


def download(url):
    url = url.split("?")[0] + "?raw=1"
    r = requests.get(url)
    with open('tmp.zip', 'wb') as f:
        f.write(r.content)
    with zipfile.ZipFile("tmp.zip", 'r') as zip_ref:
        zip_ref.extractall("/documents")


def main():
    args = docopt.docopt(__doc__)
    url = args['<share_link_url>']
    print("Downloading from dropbox: " + url)
    download(url)

if __name__ == '__main__':
    main()
