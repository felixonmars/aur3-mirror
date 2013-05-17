# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=jackmix
pkgver=0.4.1
pkgrel=2
pkgdesc="A mixer app for JACK"
arch=(i686 x86_64)
url="http://www.arnoldarts.de/drupal/?q=JackMix"
license=('GPL')
depends=('qt4' 'lash')
makedepends=('scons')
source=("http://www.arnoldarts.de/files/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('884da2fbd68a32cce9b00bf48444dee4')

prepare() {
  # build system fixes
  sed -i "13d;22,23d" "$srcdir/$pkgname-$pkgver/SConstruct"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  scons
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bin
  install -Dm755 $pkgname/$pkgname \
    "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
