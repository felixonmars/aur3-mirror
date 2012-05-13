# Maintainer : SpepS <dreamspepser at yahoo dot it>

pkgname=jack_export
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple command line app to do multichannel exports from Ardour2 sessions"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
depends=('jack')
source=("${url}downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('3c4933377358282472a0f7a16f854160')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  # doc
  install -Dm644 ../README \
    "$pkgdir/usr/share/doc/$pkgname/README"
}
