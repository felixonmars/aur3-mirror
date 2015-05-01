##	Maintainer: shyokou <shyokou at gmail dot com>
##
pkgname=flashproxy-client
_pkgname=${pkgname%-*}
pkgver=1.7.20150224
pkgrel=1
pkgdesc='A pluggable transport proxy written in Python'
arch=('any')
url='https://crypto.stanford.edu/'${_pkgname}
license=('MIT')
conflicts=('flashproxy-client')
provides=('flashproxy-client')
depends=('python2')
makedepends=('git' 'sed')
optdepends=(
	'tor: you need tor to use this package'
	'python2-m2crypto: talk SSL via M2Crypto'
	'python2-numpy: fast mask of payload between C/S'
	'python2-miniupnpc: [WIP] map port on UPnP router'
	'python2-libnatpmp: [WIP] map port on NATPMP router'
)
source=(
	'git+https://git.torproject.org/'${_pkgname}'.git'
)
sha256sums=(
	'SKIP'
)

pkgver()	{
  cd "$srcdir/${_pkgname}"

  ##	tag & date from the last commit
  echo $(git describe --always | sed 's:-.*::').$(git log -1 --pretty='%cd' --date=short | tr --delete '-')
}

prepare() {
  cd "$srcdir/${_pkgname}"

  msg2 "Applying patch by in place sed"
  sed --in-place 's:^#!.*bin.*python:#!/usr/bin/env python2:' ${_pkgname}-*
}

package()	{
  cd "$srcdir/${_pkgname}"

  #python2 setup-common.py --verbose --dry-run install --root="${pkgdir}" --optimize=1
  for f in ${_pkgname}-* ;	do
    msg2 "Installing script ${f}"
    install -D -m 0755		"${f}"			"${pkgdir}/usr/bin/${f##*/}"
  done
  for f in ${_pkgname}/* ${_pkgname}/test/* ;	do
    if [[ -f "${f}" ]] ;	then
      msg2 "Installing module ${f}"
      install -D -m 0644	"${f}"			"${pkgdir}/usr/lib/python2.7/site-packages/${_pkgname}/${f#*/}"
    fi
  done
  for f in doc/${_pkgname}-*.1 ;	do
    msg2 "Installing manual ${f}"
    install -D -m 0644		"${f}"			"${pkgdir}/usr/share/man/man1/${f#*/}"
  done
  install -D -m 0644		ChangeLog		"${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  install -D -m 0644		LICENSE			"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 0644		README			"${pkgdir}/usr/share/doc/${pkgname}/README"
  install -D -m 0644		torrc			"${pkgdir}/etc/tor/torrc.${_pkgname}"
}

## vim:set ts=2 sw=2 et:
