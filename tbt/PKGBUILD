# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=tbt
pkgver=1.0
pkgrel=1
pkgdesc="Time Based Text records performance time of written text and vehicles it as additional information."
arch=(i686 x86_64)
url="http://tbt.dyne.org/"
license=('GPL3')
depends=('slang')
optdepends=('pygtk: Gtk GUI'
            'perl-term-readkey: perl implementation'
            'php: php implementation')
source=("http://ftp.dyne.org/$pkgname/releases/$pkgname-$pkgver.tar.gz")
md5sums=('e52e909a08b4c33a331b1ef69c861472')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix symlinks
  sed -i '/ln/s/\$(PREFIX)\(.*tbt\)/\/usr\1/' Makefile

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # prepare folders
  install -d "$pkgdir/usr/"{bin,share/man/man1}

  make PREFIX="$pkgdir/usr" install

  # pygtk gui
  install -Dm755 pygui/gtbt.py \
    "$pkgdir/usr/bin/gtbt"

  install -Dm644 pygui/gtbt.glade \
    "$pkgdir/usr/share/gtbt/gtbt.glade"

  # fix glade path and add python2 shebang
  sed -e 's|gtbt|/usr/share/gtbt/&|' \
      -e 'x;1i#!/usr/bin/env python2' \
      -i "$pkgdir/usr/bin/gtbt"

  # php js and perl implementations, poetry, examples
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a js poetry tbt-tools web \
    "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
