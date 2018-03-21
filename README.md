orgsleep
========

Use Emacs Org-mode to graph your sleeping pattern.


![my graph](https://raw.githubusercontent.com/AlexDaniel/orgsleep/master/examples/graph.png)

Usage
-----

This command was used to generate the [example](examples/):

```bash
bin/orgsleep '--title=Sleeping pattern of an average AlexDaniel' \
             '--subtitle=Sample size: 1'                          \
             '--out=examples/graph.png'                            \
             examples/sleep.org examples/tom-thumb.json
```

Use your own org file to plot your data.


Dependencies
------------
You must have ``Image::Magick`` Perl5 module installed. On Debian-based systems use:

```bash
sudo apt install libimage-magick-perl
```
