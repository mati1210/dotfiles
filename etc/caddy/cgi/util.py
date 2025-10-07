import os


def sendheaders(headers: list[str]):
    print(*headers, sep="\r\n", end="\r\n\r\n")


def isCGI() -> bool:
    return os.getenv("GATEWAY_INTERFACE") == "CGI/1.1"


def err(msg, code=500):
    sendheaders([f"Status: {code}", "Content-type: text/html"])
    print(msg)
    exit()


def notfound():
    err("not found!", code=404)
