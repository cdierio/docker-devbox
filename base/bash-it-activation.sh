#!/bin/bash -l
echo "enabling plugins ... $BASH_IT_PLUGINS"
for p in $BASH_IT_PLUGINS;
  do
    bash-it enable plugin $p;
  done;
echo "enabling aliases ... $BASH_IT_ALIASES"
for a in $BASH_IT_ALIASES;
  do
    bash-it enable alias $a;
  done;
echo "enabling completions ... $BASH_IT_COMPLETIONS"
for c in $BASH_IT_COMPLETIONS;
  do
    bash-it enable completion $c;
  done;
