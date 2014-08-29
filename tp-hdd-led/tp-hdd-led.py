#!/usr/bin/python
import time


led = "0"


def on(file):
    file.write(led + " on")
    file.flush()


def off(file):
    file.write(led + " off")
    file.flush()


def blink(file):
    file.write(led + " blink")
    file.flush()


def get_val(line):
    a = line.strip(' ').split(' ')
    for x in range(a.count('')):
        a.remove('')
    return a


def blink():
    with open("/proc/acpi/ibm/led", "w") as l:
        off(l)
        time.sleep(0.4)
        on(l)
        time.sleep(0.1)


if __name__ == "__main__":
    i = ''
    while True:
        with open("/proc/diskstats", "r") as s:
            time.sleep(.1)
            s = s.read()
            if s != i:
                blink()
            i = s


