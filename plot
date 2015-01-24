#!/usr/bin/env python
import numpy as np
from matplotlib import pyplot as plt
from matplotlib import dates
import datetime
import re

x = []
y1 = []
y2 = []
colors = []

regexDate = r'\[([0-9]{4}-[0-9]{2}-[0-9]{2}) [a-zA-Z]{3} ([0-2][0-9]:[0-5][0-9])\]'
regexFull = r'\s+CLOCK: ' + regexDate + '--' + regexDate

with open('sleep.org', 'r') as f:
    array = []
    for curLine in f:
        match = re.match(regexFull, curLine)
        if match:
            startDate = datetime.datetime.strptime(match.group(1), "%Y-%m-%d")
            startTime = datetime.datetime.strptime(match.group(2), "%H:%M")
            endDate   = datetime.datetime.strptime(match.group(3), "%Y-%m-%d")
            endTime   = datetime.datetime.strptime(match.group(4), "%H:%M")

            color = 'green' if 4 <= endDate.weekday() <= 5 else 'blue' # green weekend nights
            if startDate == endDate:
                pass
                x.append(dates.date2num(startDate))
                y1.append(dates.date2num(startTime))
                y2.append(dates.date2num(endTime))
                colors.append(color)
            else:
                x.append(dates.date2num(startDate))
                y1.append(dates.date2num(startTime))
                y2.append(dates.date2num(datetime.datetime(startTime.year, startTime.month, startTime.day, 23, 59, 59)))
                colors.append(color)

                x.append(dates.date2num(endDate))
                y1.append(dates.date2num(datetime.datetime(endTime.year, endTime.month, endTime.day, 0, 0, 1)))
                y2.append(dates.date2num(endTime))
                colors.append(color)

#plt.xkcd() # requires fonts-humor-sans package !!!
plt.style.use('dark_background')
fig = plt.figure()
ax = fig.add_subplot(111)
ax.vlines(x, y2, y1, colors)

ax.xaxis_date()
ax.xaxis.set_major_locator(dates.DayLocator(interval=5))
ax.xaxis.set_major_formatter(dates.DateFormatter('%Y-%m-%d'))
ax.xaxis.set_minor_locator(dates.DayLocator())


ax.yaxis_date()
ax.yaxis.set_major_formatter(dates.DateFormatter('%H:%M'))
ax.yaxis.set_major_locator(dates.HourLocator())

ax.set_xlim(left = x[-1], right = x[0])

ax.grid()

#fig.autofmt_xdate()
fig.set_size_inches(25, 6)

plt.tick_params(axis='both', which='major', labelsize=6, direction='out', labeltop='on', labelright='on')
plt.xticks(rotation=-45)
#plt.tick_params(axis='both', which='minor', labelsize=5)

plt.savefig('sleep_new.png', dpi=100, bbox_inches='tight')
