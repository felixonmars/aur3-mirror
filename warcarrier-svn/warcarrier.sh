#!/bin/bash

export PERL5LIB="/opt/warcarrier/lib/"

(pushd /opt/warcarrier
case "$(basename $0)" in
   warcarrier|wcclean|wcd) ./"$(basename $0)";;
esac)
