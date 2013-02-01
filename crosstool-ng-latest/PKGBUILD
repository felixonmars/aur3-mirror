# Maintainer:  nandub <dev+arch@nandub.info>

pkgname=crosstool-ng-latest
_realpkgname=crosstool-ng
pkgver=1.18.0
pkgrel=1
pkgdesc='crosstool-NG aims at building toolchains'
arch=('i686' 'x86_64')
url='http://crosstool-ng.org/'
license=(GPL)
depends=('bash>=3.1' 'make>=3.80' 'libtool>=1.5.26' 'automake>=1.10' 'binutils' 'gperf' 'wget' 'ncurses' 'gzip' 'bzip2' 'xz')
optdepends=('cvs' 'svn' )
conflicts=('crosstool-ng')
source=(http://crosstool-ng.org/download/$_realpkgname/$_realpkgname-$pkgver.tar.bz2)
md5sums=('3376d389c632baa77f0bce1db1a196a9')

build() {
  cd "$srcdir"/$_realpkgname-$pkgver
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir"/$_realpkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
