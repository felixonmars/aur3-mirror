# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=deathcrush-lv2
pkgver=04.10
pkgrel=1
pkgdesc="An lv2 plugin that ruins your sounds, part of the Russolo Suite."
arch=(i686 x86_64)
url="http://intonarumori.sourceforge.net/"
license=('GPL')
depends=('glibc' 'lv2core')
source=("http://downloads.sourceforge.net/project/intonarumori/Deathcrush/DeathcrushLV2-$pkgver.tar.bz2")
md5sums=('83908d0f7226a59f5f27772b4d1dc775')

build() {
  cd "$srcdir/DeathcrushLV2-$pkgver/src"

  make
}

package() {
  cd "$srcdir/DeathcrushLV2-$pkgver/src"

  mkdir -p "$pkgdir/usr/lib/lv2"
  cp -a "${pkgname/-/.}" "$pkgdir/usr/lib/lv2"
}

# vim:set ts=2 sw=2 et:
