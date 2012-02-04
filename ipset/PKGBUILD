# Maintainer: Sebastien Luttringer <seblu+arch@seblu.net>
pkgname=ipset
pkgver=6.9.1
pkgrel=1
pkgdesc='Administration tool for IP sets'
arch=('i686' 'x86_64')
url='http://ipset.netfilter.org'
license=('GPL2')
depends=('libmnl')
source=("http://ipset.netfilter.org/$pkgname-$pkgver.tar.bz2")
md5sums=('71f4b826e025be5918a52e9843673167')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 ft=sh et:
