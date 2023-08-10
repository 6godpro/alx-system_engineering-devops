#!/usr/bin/python3
"""fetch the number of subscribers for a particular subreddit"""
import requests


def number_of_subscribers(subreddit) -> int:
    """Returns the number of subscribers for a subreddit
    Args:
        subreddit(string) -> The fetch focus.
    """
    header = {
        "User-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
    }
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    result = requests.get(url, allow_redirects=False, headers=header)
    about = result.json().get('data', None)
    if about is None:
        return 0
    subs = about.get('subscribers', None)
    return subs
