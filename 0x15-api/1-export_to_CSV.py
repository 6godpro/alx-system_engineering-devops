#!/usr/bin/python3
"""
    Fetches data from an API and displays the result in
    CSV format.
"""
import requests
from sys import argv


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/users/{}"\
          .format(argv[1])
    response = requests.get(url)
    u_name = response.json()['username']
    url = "https://jsonplaceholder.typicode.com/todos/?userId={}"\
          .format(argv[1])
    response = requests.get(url)
    with open("{}.csv".format(argv[1]), 'w', newline='') as file:
        for _dict in response.json():
            completed = _dict['completed']
            title = _dict['title']
            file.write(f'"{argv[1]}","{u_name}","{completed}","{title}"\n')
