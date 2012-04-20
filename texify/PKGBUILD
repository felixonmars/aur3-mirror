# Contributor: rickyc85
# Maintainer: tychoish
pkgname=texify
pkgver=1.20_all
pkgrel=1
pkgdesc="A perl script that translates source code written in any of several different languages to LaTeX source files (eg. c, vhdl, java...)"
license=('GPL')
depends=('perl')
arch=('i686' 'x86_64')
url="http://packages.debian.org/stable/utils/texify"
source=(http://ftp.egr.msu.edu/debian/pool/main/t/$pkgname/$pkgname\_$pkgver.deb)
md5sums=('2f5cfec1bae345c8d617006b935ac97f')
build() {
    ar -x $pkgname\_$pkgver.deb
    gzip -d data.tar.gz
    tar -xvf data.tar
    mkdir -p $startdir/pkg/usr
    cp -aR usr/* $startdir/pkg/usr/
}
