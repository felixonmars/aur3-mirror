#!/bin/bash
export ORION_APP=/usr/share/orion
export ORION_HOME=/var/lib/orion
${ORION_APP}/orion -data ${ORION_HOME} "$@"

