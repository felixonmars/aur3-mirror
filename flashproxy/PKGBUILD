## Maintainer: shyokou <shyokou at gmail dot com>
##
pkgname=flashproxy
_pkgname=${pkgname}-client
pkgver=1.7
pkgrel=1
pkgdesc='A pluggable transport proxy written in Python'
arch=('any')
url='https://crypto.stanford.edu/'${pkgname}
license=('MIT')
depends=('python2')
optdepends=(
	'tor: you need tor to use this package'
	'python2-numpy: fast mask of payload between C/S'
	'python2-m2crypto: talk SSL via M2Crypto'
	'miniupnpc-python2: [WIP] map port on UPnP router'
	'libnatpmp-python2: [WIP] map port on NATPMP router'
)
source=(
	'https://people.torproject.org/~dcf/'${pkgname}/${_pkgname}-${pkgver}'.zip'{,.asc}
)
sha256sums=(
	'309e82625bcc0bf866bcecd479444ce13075af16153f5d1a79b040f3e37e7c69'
	'3d11cf2939c4c71798c41e8459be25761fb720a7bfb16c674c761cd78d28d9f6'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  msg2 "Applying patch by in place sed"
  sed -i -e 's:^#!.*bin.*python:#!/usr/bin/env python2:' ${pkgname}-*
}

package()	{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m 0644	ChangeLog	"${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  for f in doc/${pkgname}-*.1 ;	do
    msg2 "Installing manual ${f##*/}"
    install -D -m 0644	"${f}"		"${pkgdir}/usr/share/man/man1/${f##*/}"
  done
  for f in ${pkgname}-* ;	do
    msg2 "Installing script ${f##*/}"
    install -D -m 0755	"${f}"		"${pkgdir}/usr/bin/${f##*/}"
  done
  for f in ${pkgname}/* ;	do
    msg2 "Installing module ${f##*/}"
    install -D -m 0644	"${f}"		"${pkgdir}/usr/lib/python2.7/site-packages/${pkgname}/${f##*/}"
  done
  install -D -m 0644	LICENSE		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 0644	README		"${pkgdir}/usr/share/doc/${pkgname}/README"
  install -D -m 0644	torrc		"${pkgdir}/etc/tor/torrc.${pkgname}"
}

## vim:set ts=2 sw=2 et:
