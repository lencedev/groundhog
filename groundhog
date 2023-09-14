#!/bin/python3

import math
import sys

def calculate_g(arr, is_g, n):
    if not is_g:
        g = "nan"
    else:
        g = 0
        for i in range(len(arr)-1, 0, -1):
            diff = arr[i] - arr[i-1]
            if diff > 0:
                g += diff
            else:
                g += 0
        g /= len(arr) - 1
        g = round(g, 2)
        g = "{:.2f}".format(g)
    return g

def calculate_rv2(arr, is_r, struct):
    n = struct["n"]
    if (arr[0] == 0):
        return "nan%"
    if not is_r:
        r = "nan"
    else:
        r = (arr[n] - arr[0]) / arr[0]
        r *= 100
        r = round(r, 0)
        r = "{:.0f}".format(r)
        arr.pop(0)
    return r + '%'

def calculate_r(arr, is_r, n):
    if (arr[0] == 0):
        return "nan%"
    if not is_r:
        r = "nan"
    else:
        r = (arr[n] - arr[0]) / arr[0]
        r *= 100
        r = round(r, 0)
        r = "{:.0f}".format(r)
        arr.pop(0)
    return r + '%'

def calculate_s(arr, is_s, n):
    #if (n == 0):
     #   s = 0
      #  return
    if not is_s:
        return "nan"
    else:
        mean = sum(arr) / n
        variances = [(x - mean)**2 for x in arr]
        variance = sum(variances) / (n)
        s = math.sqrt(variance)
        s = round(s, 2)
        s = "{:.2f}".format(s)
        return s

def check_switch(lst, struct):
    i = len(lst)
    if len(lst) < 2:
        return False
    if (lst[i - 1] != "nan"):
        if lst[i-1][0] == '-' and lst[i-2][0] != '-':
            struct['switch'] += 1
            return True
        if lst[i-1][0] != '-' and lst[i-2][0] == '-':
            struct['switch'] += 1
            return True
    return False

def display_interfaces(arr, struct, n):
    g = calculate_g(arr, struct['g'], n)
    print(f"g={g}", end='')

    r = calculate_r(arr, struct['r'], n)
    print(f"\t\tr={r}", end='')

    s = calculate_s(arr, struct['s'], n)

    if struct['r']:
        struct['all_r'].append(r)
        if check_switch(struct['all_r'] ,struct):
            print(f"\t\ts={s}", end='')
            print("\t\ta switch occurs")
        else:
            print(f"\t\ts={s}")
    else:
        print(f"\t\ts={s}")

def stop_manager(user_input, temp, struct):
    if (user_input == "STOP"):
        if (len(temp) < struct["n"]):
            exit(84)
        if struct['switch'] > 0:
            print(f"Global tendency switched {struct['switch']} times")
        else:
            print(f"Global tendency switched 0 times")
        exit(0)

def get_user_input(n):
    user_responses = []
    i = 0
    struct = {
        "g" : False,
        "r" : False,
        "s" : False,
        "switch" : 0,
        "n" : n,
        "all_r" : []
    }
    while True:
        user_input = input("")
        i+=1
        stop_manager(user_input, user_responses, struct)
        if i > n:
            struct['g'] = True
            struct['r'] = True
        if i >= n:
            struct['s'] = True
        try:
            user_input = float(user_input)
            user_responses.append(user_input)
            display_interfaces(user_responses, struct, n)
        except ValueError:
            print("Error: input has to be a number.")
            exit(84)

def main():
    if len(sys.argv) < 2:
        exit(84)
    if sys.argv[1] == "-h":
        print("""SYNOPSIS\n \t./groundhog period
        \nDESCRIPTION\n\tperiod\tthe number of days defining a period""")
        return
    get_user_input(int(sys.argv[1]))
main()
