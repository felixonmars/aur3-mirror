# Maintainer: Antony Male <antony dot male at geemail dot com>>
pkgname=snappy
pkgver=1.0.5
pkgrel=2
pkgdesc="A compression/decompression library which does not aim for maximum compression, instead aiming for very high speeds and reasonable compression."
arch=('i686' 'x86_64' 'arm')
url="http://code.google.com/p/snappy/"
license=('custom')
source=(http://snappy.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('4c0af044e654f5983f4acbf00d1ac236')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/snappy/LICENSE"
}

# vim:set ts=2 sw=2 et:
