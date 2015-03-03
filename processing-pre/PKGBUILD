# Maintainer: Darko Janković <darko.jankovic2@gmail.com>

pkgname=processing-pre
_srcname=processing
pkgver=3.0a5
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc='Programming environment for creating images, animations and interactions. Pre-release version'
url='http://www.processing.org/'
license=('GPL' 'LGPL')
depends=('libgl' 'libxxf86vm')
makedepends=('gendesk')
options=('!strip')
source_x86_64=("http://download.$_srcname.org/$_srcname-$pkgver-linux64.tgz")
source_i686=("http://download.$_srcname.org/$_srcname-$pkgver-linux32.tgz")
sha256sums_x86_64=('7c10f0209499748a6f148bab6b7e5908b9a827d1bb5dca901abb6650fbf579d4')
sha256sums_i686=('7a405b0876f2e987ac72befb19e9731ffc3e5afcec12a3acf569285b0406316c')

prepare() {
  gendesk -n --pkgname="$pkgname" --pkgdesc="$pkgdesc"
}

package() {
  cd "$_srcname-$pkgver"
  
  install -d "$pkgdir/usr/bin/" "$pkgdir/usr/share/$pkgname/"
  cp -r * "$pkgdir/usr/share/$pkgname/"
  ln -s "/usr/share/$pkgname/$_srcname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/share/$pkgname/$_srcname-java" "$pkgdir/usr/bin/$pkgname-java"

  # Desktop icon / application shortcut
  install -Dm644 "lib/icons/pde-128.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}