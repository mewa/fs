#!/usr/bin/env python3

import sys
import subprocess
import time
import logging

def main():
    logging.basicConfig(filename='api.log', level=logging.INFO)

    num = int(sys.argv[1])
    exprs = sys.argv[2:]

    if len(exprs) != num:
        msg = "Error, expecting {:d} expressions, got {:d}".format(num, len(exprs))
        logging.error(msg)
        print(msg)
        exit(1)

    logging.info("Processing {:d} expressions: {:s}".format(num, str(exprs)))

    for expr in exprs:
        start = time.perf_counter()
        process = subprocess.run(["./ruby/calculator.rb", expr],
                                 stdout = subprocess.PIPE,
                                 stderr = subprocess.PIPE)

        err = process.stderr.decode("utf-8")
        if len(err) > 0:
            logging.error(err)
            print("Error:", err)
            exit(1)

        end = time.perf_counter()
        result = process.stdout.decode("utf-8")

        print("{:s}, {:f}".format(result, end - start))

if __name__ == "__main__":
    main()
