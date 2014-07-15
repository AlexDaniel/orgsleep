orgsleep
========

Use Emacs Org-mode to graph your sleep pattern.


![My pattern](https://dl.dropboxusercontent.com/u/71236259/sleep.png)

Usage
-----
Edit ``sleep.org`` to add some data. Then run:
```
./processSleepTime
```
It will generate ``sleep.png`` file based on clock times in your ``sleep.org`` file.

Dependencies
------------
You must have ``gnuplot`` installed in order for this script to work. On Debian-based systems use:
```
sudo apt-get install gnuplot
```
