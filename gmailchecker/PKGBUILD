# Maintainer: trile7 at gmail dot com

pkgname=gmailchecker
pkgver=0.2.3
pkgrel=3
pkgdesc="Simple script for checking gmail with trayicon and tooltip and play sound"
url="http://bashscripts.googlecode.com"
arch=('any')
license=('GPL3')
depends=(yad imagemagick wget sed coreutils procps-ng)
optdepends=("alsa-utils: play sound on new mail")
source=($url/files/$pkgname-$pkgver.tar.gz)

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/$pkgname-$pkgver"/* "$pkgdir/usr/share/$pkgname"
  mv "$pkgdir/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin"
}

md5sums=('fde98947194c2466dc66a4bfab4b04d9')
