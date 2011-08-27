# Maintainer: Eric Coleman <eric@colemando.com>

pkgname=wkhtmltoimage-static
pkgver="0.10.0_rc2"
pkgrel=2
pkgdesc="Simple shell utility to convert html to image using the webkit rendering engine, and qt (upstream static build)  Based off wkhtmltopdf-static by Evangelos Foutras"
arch=('i686' 'x86_64')
url="http://code.google.com/p/wkhtmltopdf/"
license=('GPL3')
options=('!strip')
if [ "$CARCH" = "i686" ]; then
  _arch="i386"
  sha1sums=('6fbe4e7e8a56c5df6111a13d1a17ceacf2ee0fbf')
else
  _arch="amd64"
  sha1sums=('fc4d7bfaf2cc24695c6f73f472ac240977fd1107')
fi
source=(http://wkhtmltopdf.googlecode.com/files/wkhtmltoimage-$pkgver-static-$_arch.tar.bz2)

build() {
  cd "$srcdir"

  install -D wkhtmltoimage-$_arch "$pkgdir/usr/bin/wkhtmltoimage" || return 1

  # Generate and install man page
  install -d "$pkgdir/usr/share/man/man1"
  ./wkhtmltoimage-$_arch --manpage >"$pkgdir/usr/share/man/man1/wkhtmltoimage.1"
}

# vim:set ts=2 sw=2 et:
