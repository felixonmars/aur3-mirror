# Maintainer: lolilolicon <(loli){2}con@gmail\.com>

pkgname=msort
pkgver=8.53
pkgrel=2
pkgdesc="Msort sorts files in sophisticated ways: number systems, regex, separators, keys, sorting algorithms. It understands UTF8-Unicode and locales."
arch=('i686' 'x86_64')
url="http://billposer.org/Software/msort.html"
license=('GPL')
depends=('tre' 'utf8proc' 'libuninum')
optdepends=('iwidgets: For the msort GUI')
source=(http://billposer.org/Software/Downloads/$pkgname-$pkgver.tar.gz)
md5sums=('a6468fbb8503bb52331994f96eb7b54c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # --disable-utf8proc to use libicu instead (fails for me).
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install-strip

  # rename msg (the gui script), what a bad name :D
  mv "$pkgdir"/usr/bin/msg{,.tcl}
  # install license
  install -Dm644 {,"$pkgdir/usr/share/licenses/$pkgname/"}COPYING
}
