import sys

from fastapi import FastAPI
import json 
app = FastAPI()


@app.get("/")
def root():
    return {"message": "Hello World"}


def _fib(n):
    if n < 2:
        return 1
    return _fib(n - 1) + _fib(n - 2)


@app.get("/fib/{n}")
def fib(n: int):
    nogil_status = getattr(sys.flags, "nogil", False)
    return {"result": _fib(n), "nogil": nogil_status}
