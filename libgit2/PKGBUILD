# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=libgit2
pkgver=0.11.0
pkgrel=1
pkgdesc="A linkable library for Git"
arch=('i686' 'x86_64')
url="http://libgit2.github.com/"
depends=('zlib')
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://www.github.com/libgit2/libgit2/tarball/v$pkgver")
md5sums=('ebd196c19663385c3ef8c8c8fac90c5b')

build() {
  dirname=$(tar tf "$srcdir/$pkgname-$pkgver.tar.gz" | sed 1q);

  cd "$srcdir/$dirname"

  ./waf configure --prefix=/usr
  ./waf
}

package() {
  dirname=$(tar tf "$srcdir/$pkgname-$pkgver.tar.gz" | sed 1q);

  cd "$srcdir/$dirname"
  ./waf install --destdir="$pkgdir"
}

# vim: ft=sh syn=sh
