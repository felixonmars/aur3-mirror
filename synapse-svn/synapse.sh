#!/bin/bash

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/synapse:/opt/synapse/plugins"
exec /opt/synapse/alter

# vim: set noet ff=unix:
