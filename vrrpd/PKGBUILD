#
# Contributor Luca Gervasi <luca.gervasi on GMAIL>
#
# $Id$

pkgname=vrrpd
pkgver=1.0
pkgrel=1
pkgdesc="Linux implementation of Virtual Router Redundancy Protocol"
arch=('i686' 'x86_64')
url="http://vrrpd.sf.net/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
#source=($pkgname-$pkgver.tar.gz)
source=(http://sourceforge.net/projects/vrrpd/files/vrrpd/1.0/vrrpd-1.0.tar.gz/download)
md5sums=('6d5066ea1a6ced817376ca0f54765447')
build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
	cp vrrpd /usr/bin || return 1
	cp vrrpd.8 /usr/share/man/man8 || return 1
}

