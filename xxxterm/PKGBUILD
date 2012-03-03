# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=xxxterm
pkgver=1.11.3
pkgrel=1
pkgdesc="A minimalists web browser, vi-like while maintaining traditional web browser behavior."
arch=('i686' 'x86_64')
url="http://opensource.conformal.com/wiki/XXXTerm"
license=('custom:ISC')
depends=('libwebkit' 'gtk2' 'libbsd')
optdepends=()
source=(http://opensource.conformal.com/snapshots/$pkgname/$pkgname-$pkgver.tgz \
        LICENSE)
md5sums=('814399e3aee95c06bca9deb3c49a92a8'
         'f3eeb6e8b70a3dcccb8ee57daf584c9e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|LIBS= gtk+-2.0|& javascriptcoregtk-1.0|' linux/Makefile
  sed -i 's|/etc/ssl/cert.pem|/etc/ssl/certs/ca-certificates.crt|' xxxterm.conf
  # no spam
  sed -i 's|https://www.cyphertite.com|https://archlinux.org|' xxxterm.{c,conf}
  sed -i 's|/usr/local/share/xxxterm/|/usr/share/xxxterm/|' xxxterm.{c,conf}
  cd linux
  sed -i 's/gnutls/& libbsd/' Makefile
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  cd ..
  install -Dm644 xxxterm.conf "$pkgdir/etc/skel/xxxterm.conf"
  install -Dm644 xxxterm.desktop "$pkgdir/usr/share/applications/xxxterm.desktop"
  cd ../..
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

