# Maintainer: Marko Vojvodić <marko-v@lugons.org>

pkgname=wkhtmltopdf-static-0.11.0
pkgver=0.11.0
pkgrel=1
pkgdesc="Simple shell utility to convert html to pdf using the webkit rendering engine, and qt (upstream static build)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/wkhtmltopdf/"
license=('GPL3')
conflicts=('wkhtmltopdf')
options=('!strip')
if [ "$CARCH" = "i686" ]; then
  _arch="i386"
  sha1sums=('30e42234c4570ab2d6cad5f6ef68b6b57ec2f0c8')
else
  _arch="amd64"
  sha1sums=('1f5a9ed45c029055b2770d56ec31c890a3e2d33f')
fi
source=(http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-${pkgver}_rc1-static-${_arch}.tar.bz2)

build() {
  cd "$srcdir"

  install -D wkhtmltopdf-$_arch "$pkgdir/usr/bin/wkhtmltopdf" || return 1

  # Generate and install man page
  install -d "$pkgdir/usr/share/man/man1"
  ./wkhtmltopdf-$_arch --manpage >"$pkgdir/usr/share/man/man1/wkhtmltopdf.1"
}
