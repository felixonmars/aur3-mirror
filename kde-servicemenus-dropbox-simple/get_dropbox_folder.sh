#!/bin/bash

cat $HOME/.dropbox/info.json | perl -MJSON -nE 'say decode_json($_)->{personal}{path}'
