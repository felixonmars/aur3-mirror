# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=monster
pkgver=0.12
pkgrel=1
pkgdesc="An advanced scripting language made with game development in mind"
arch=('i686' '!x86_64')
url="http://monster.snaptoad.com/"
license=('GPL3')
makedepends=('dmd<2' 'dsss')
source=(http://downloads.sourceforge.net/monster-script/$pkgname-$pkgver.tar.gz)
md5sums=('ae0f277bfd2978a76ed332e1d6c169a6')

build() {
  cd $pkgname-$pkgver

  dsss build --prefix=/usr
  dsss install --prefix="$pkgdir"/usr

  chmod 644 "$pkgdir"/usr/share/dsss/manifest/$pkgname-$pkgver.manifest
}

# vim:set ts=2 sw=2 et:
