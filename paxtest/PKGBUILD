# Maintainer: Lubomir Krajcovic <lubomir.krajcovic(AT)gmail(DOT)com>
# Contributor: sh0 <mee(AT)sh0(DOT)org>
# Contributor: leoarcher <carvalho.inacio(AT)gmail(DOT)com>

pkgname='paxtest'
pkgver='0.9.11'
pkgrel=1
pkgdesc='PaX regression test suite'
url='http://pax.grsecurity.net'
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=()
source=("http://grsecurity.net/~spender/${pkgname}-${pkgver}.tar.gz")
md5sums=('04ec4a600052c86ee341bbe0240d02c0')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mymake="make -f Makefile.psm DESTDIR=\"${pkgdir}\" BINDIR=\"/usr/bin\" RUNDIR=\"/usr/lib/${pkgname}\""
	${mymake} && ${mymake} install || return 1
}
