#!/bin/bash

# Use this as a template for your own configuration, to be placed in ~/.h2statusrc.
# All three functions are optional as a default NOP implementation is provided.
# Remember to configure output_format = "i3bar" in ~/.i3status.conf.

function status {
  entry sync_random "SR: $RANDOM" '"color":"$00FF00"'
  entry async_random "ar: $(cached_status async_random 30 'echo $RANDOM')"
}

function on_event {
  case $name in
  async_random) [[ $button == 1 ]] && write_status async_random $RANDOM
  esac
}

function transform {
  sed -r 's/ar:/AR:/'
}
