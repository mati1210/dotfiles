import os, time
from pathlib import Path


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


class SimpleRatelimit:
    def __init__(self, folder: str | os.PathLike, start_ns: int | None = None) -> None:
        self.folder = Path(folder)
        self.folder.mkdir(parents=True, exist_ok=True)
        self.ip = self.folder / (os.getenv("REMOTE_ADDR") or err("envs not setup!"))

        self.start = start_ns or time.time_ns()

    def check(self, limit_ns: int, update: bool = True):
        try:
            last = self.ip.stat().st_mtime_ns

            if self.start - last < limit_ns:
                err("too soon!", 429)

        except FileNotFoundError:
            pass

        if update:
            self.ip.touch(0o600, exist_ok=True)
            os.utime(self.ip, ns=(0, self.start))
