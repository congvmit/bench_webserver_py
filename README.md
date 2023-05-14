# Webserver Performance Bench with Uvicorn and Gunicorn in Docker


## Requirements:
You can check the detail in `requirements.txt`
```bash
drill
fastapi
uvicorn
gunicorn
```

## How to run
```
./cmd.sh build_run
./cmd.sh test_throughput
```

## Results

**Device:** Apple M1 Pro \
**Configurations of Uvicorn + Guvicorn:** Please check Dockerfiles. In short, I use 18 workers in each apps.


```bash
Concurrency 18
Iterations 10000
Rampup 0
Base URL http://localhost


FastAPI FIB Uvicorn Async Total requests            20000
FastAPI FIB Uvicorn Async Successful requests       20000
FastAPI FIB Uvicorn Async Failed requests           0
FastAPI FIB Uvicorn Async Median time per request   4ms
FastAPI FIB Uvicorn Async Average time per request  7ms
FastAPI FIB Uvicorn Async Sample standard deviation 6ms
FastAPI FIB Uvicorn Async 99.0'th percentile        30ms
FastAPI FIB Uvicorn Async 99.5'th percentile        36ms
FastAPI FIB Uvicorn Async 99.9'th percentile        50ms

Time taken for tests      7.3 seconds
Total requests            20000
Successful requests       20000
Failed requests           0
Requests per second       2746.86 [#/sec]
Median time per request   4ms
Average time per request  7ms
Sample standard deviation 6ms
99.0'th percentile        30ms
99.5'th percentile        36ms
99.9'th percentile        50ms
Concurrency 18
Iterations 10000
Rampup 0
Base URL http://localhost


FastAPI FIB Uvicorn+Gunicorn Total requests            10000
FastAPI FIB Uvicorn+Gunicorn Successful requests       10000
FastAPI FIB Uvicorn+Gunicorn Failed requests           0
FastAPI FIB Uvicorn+Gunicorn Median time per request   1ms
FastAPI FIB Uvicorn+Gunicorn Average time per request  2ms
FastAPI FIB Uvicorn+Gunicorn Sample standard deviation 1ms
FastAPI FIB Uvicorn+Gunicorn 99.0'th percentile        7ms
FastAPI FIB Uvicorn+Gunicorn 99.5'th percentile        8ms
FastAPI FIB Uvicorn+Gunicorn 99.9'th percentile        13ms

Time taken for tests      0.9 seconds
Total requests            10000
Successful requests       10000
Failed requests           0
Requests per second       11546.26 [#/sec]
Median time per request   1ms
Average time per request  2ms
Sample standard deviation 1ms
99.0'th percentile        7ms
99.5'th percentile        8ms
99.9'th percentile        13ms
Concurrency 18
Iterations 10000
Rampup 0
Base URL http://localhost


FastAPI FIB Uvicorn Sync  Total requests            10000
FastAPI FIB Uvicorn Sync  Successful requests       10000
FastAPI FIB Uvicorn Sync  Failed requests           0
FastAPI FIB Uvicorn Sync  Median time per request   3ms
FastAPI FIB Uvicorn Sync  Average time per request  5ms
FastAPI FIB Uvicorn Sync  Sample standard deviation 4ms
FastAPI FIB Uvicorn Sync  99.0'th percentile        19ms
FastAPI FIB Uvicorn Sync  99.5'th percentile        23ms
FastAPI FIB Uvicorn Sync  99.9'th percentile        34ms

Time taken for tests      2.6 seconds
Total requests            10000
Successful requests       10000
Failed requests           0
Requests per second       3848.39 [#/sec]
Median time per request   3ms
Average time per request  5ms
Sample standard deviation 4ms
99.0'th percentile        19ms
99.5'th percentile        23ms
99.9'th percentile        34ms
```

## Issues

1. High CPU usage \
https://github.com/cirospaciari/socketify.py/issues/119
