#!/usr/bin/python3
"""
    Fetches data from an API and displays the result in
    CSV format.
"""
import csv
import requests
from sys import argv


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/users/{}"\
          .format(argv[1])
    response = requests.get(url)
    u_name = response.json()['username']
    url = "https://jsonplaceholder.typicode.com/todos/?userId={}"\
          .format(argv[1])
    response = requests.get(url).json()
    with open("{}.csv".format(argv[1]), 'w', newline='') as csv_file:
        csv_writer = csv.writer(csv_file)
        for _dict in response:
            csv_writer.writerow([argv[1], u_name,
                                _dict['completed'],
                                _dict['title']])
