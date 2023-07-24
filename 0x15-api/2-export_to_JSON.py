#!/usr/bin/python3
"""
    Fetches data from an API and displays the result in
    JSON format.
"""
import json
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
    with open("{}.json".format(argv[1]), 'w') as file:
        new_dict = {
            argv[1]: [
                {"task": _dict['title'],
                 "completed": _dict['completed'],
                 "username": u_name}
                for _dict in response.json()
            ]
        }
        file.write(json.dumps(new_dict))
