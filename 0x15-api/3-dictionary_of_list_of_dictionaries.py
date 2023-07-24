#!/usr/bin/python3
"""
    Fetches TODO data of all employees from an API and displays
    the result in JSON format.
"""
import json
import requests
from sys import argv


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/users/"
    users = {_dict['id']: _dict['username']
             for _dict in requests.get(url).json()}
    new_dict = {
        id: [{"username": u_name,
              "task": d['title'],
              "completed": d['completed']}
             for d in requests.get(
                     "https://jsonplaceholder.typicode.com/todos/?userId={}"
                     .format(id)).json()
             ] for id, u_name in users.items()
    }

    with open("todo_all_employees.json", 'w') as file:
        file.write(json.dumps(new_dict))
