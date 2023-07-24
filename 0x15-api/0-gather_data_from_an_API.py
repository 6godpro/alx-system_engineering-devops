#!/usr/bin/python3
"""
    Retrieves information about an employees given their ID.
"""

from sys import argv
from urllib import request


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/users/{}"\
          .format(argv[1])
    response = request.urlopen(url)
    emp_name = eval(response.read().decode("utf-8"))['name']
    url = "https://jsonplaceholder.typicode.com/todos/?userId={}"\
          .format(argv[1])
    with request.urlopen(url) as response:
        response = response.read().decode("utf-8")
        response = response.replace('false', 'False')
        response = response.replace('true', 'True')
        response = eval(response)
        done = sum([1 for _dict in response if _dict['completed']])
        print("Employee {} is done with tasks({}/{}):"
              .format(emp_name, done, len(response)))
        [print("\t {}".format(_dict['title'])) for _dict in response
         if _dict['completed']]
