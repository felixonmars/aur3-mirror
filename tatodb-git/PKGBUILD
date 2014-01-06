# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase='tatodb'
pkgname="$pkgbase-git"
true && pkgname=("$pkgbase-libtato-git" "$pkgbase-server-git")
pkgver=r4.84ce1f0
pkgrel=1
pkgdesc='TODO'
arch=('i686' 'x86_64')
url="https://github.com/allan-simon/$pkgbase"
license=('TODO')
makedepends=('git' 'expat' 'libevent')

source=("git://github.com/allan-simon/$pkgbase")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgbase/libtato"
  libtoolize
  aclocal
  autoconf
  automake --add-missing

  cd "$srcdir/$pkgbase/server"
  libtoolize
  aclocal
  autoconf
  automake --add-missing
}

build() {
  cd "$srcdir/$pkgbase/libtato"
  ./configure --prefix=/usr
  make

  cd "$srcdir/$pkgbase/server"
  ./configure --prefix=/usr
  make
}

package_tatodb-libtato-git() {
  provides=("$pkgbase-libtato")
  conflicts=("$pkgbase-libtato")
  depends=('expat')

  cd "$srcdir/$pkgbase/libtato"
  make DESTDIR="$pkgdir/" install
}

package_tatodb-server-git() {
  provides=("$pkgbase-server")
  conflicts=("$pkgbase-server")
  depends=("$pkgbase-libtato" 'libevent')

  cd "$srcdir/$pkgbase/server"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sts=2 sw=2 et:
