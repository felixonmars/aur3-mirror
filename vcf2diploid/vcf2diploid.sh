#! /bin/sh
#
# vcf2dipload.sh
# Copyright (C) 2014 dacre <dacre@esmeralda>
#
# Distributed under terms of the MIT license.
#

"$JAVA_HOME/bin/java" -Xmx10000m -jar '/usr/share/java/vcf2diploid/vcf2diploid.jar' "$@"
