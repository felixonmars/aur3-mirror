# Contributor: Christian Hesse <mail@earthworm.de>

pkgname=libmnl
pkgver=1.0.1
pkgrel=1
pkgdesc="Library for minimalistic netlink"
arch=('i686' 'x86_64')
url="http://www.netfilter.org/projects/libmnl/"
license=('GPL')
conflicts=('libmnl-git')
source=("http://www.netfilter.org/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2")

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('e936236bb57a2375afa4e70e75dc3ba9')
