#!/bin/bash
pkgname=<>
pkgdir=<>

pushd "$pkgdir" > /dev/null
"./$pkgname" "$@"
popd > /dev/null
