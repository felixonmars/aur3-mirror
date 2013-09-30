#!/bin/sh

pkgname=apmil

cd "/usr/share/$pkgname" && \
    python2 ${pkgname}.py ; \
    cd "$OLDPWD"
