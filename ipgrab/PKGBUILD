# Maintainer: Estevao Valadao <estevao@archlinux-br.org>

pkgname=ipgrab
pkgver=0.9.8
pkgrel=1
pkgdesc="A verbose packet sniffer for UNIX hosts"
arch=('i686' 'x86_64')
url="http://ipgrab.sourceforge.net/"
license=('GPL')
makedepends=('libpcap')
source=(http://download.sourceforge.net/ipgrab/${pkgname}-${pkgver}.tar.gz)
sha1sums=('2affbec9bf3ad27aa01879b4ca2a0ac393d4f0d2')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
