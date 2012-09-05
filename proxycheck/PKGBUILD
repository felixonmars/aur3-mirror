# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=proxycheck
pkgver=0.49a
pkgrel=1
pkgdesc='Open proxy detection utility'
arch=('i686' 'x86_64')
url='http://www.corpit.ru/mjt/proxycheck.html'
license=('GPL')
groups=()
depends=(glibc)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://www.corpit.ru/mjt/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()

build(){
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 proxycheck $pkgdir/usr/bin/proxycheck
  install -Dm644 proxycheck.1 $pkgdir/usr/share/man/man1/proxycheck.1
}
md5sums=('5121f100ca36c7afbb7e3f48eafdf0d5')
