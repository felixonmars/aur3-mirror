# Maintainer: Jasper Poppe <jgpoppe at gmail dot com>
pkgname=vilistextum
pkgver=2.6.9
pkgrel=2
pkgdesc="A utility for converting HTML into plain text (e.g. for viewing in Mutt)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://bhaak.net/vilistextum/"
depends=('glibc')
source=(http://bhaak.net/vilistextum/$pkgname-$pkgver.tar.bz2)
md5sums=('661c9e406a64d174f1dde5e14f54fb5d')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-multibyte
  make || return 1
  make DESTDIR="$pkgdir/" mandir="usr/share/man" install || return 1
}

# vim:set ts=2 sw=2 et:
