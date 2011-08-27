# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mildred <silkensedai@online.fr>

pkgname=lisaac
pkgver=0.13.1
pkgrel=1
pkgdesc="A small prototype-based programming language"
arch=('i686')
url="http://isaacproject.u-strasbg.fr/li.html"
license=('GPL3')
source=(http://isaacproject.u-strasbg.fr/download/$pkgname-$pkgver.tar.gz)
md5sums=('a2a6cb1d70e3e7b50d06e61516ef4271')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
