# Contributor: Black_Mage <vleon1@gmail.com>

pkgname=tbp-cpack
pkgver=2.0
pkgrel=1
pkgdesc="The Babylon Project User-Made Campaign Pack"
url="http://www.hard-light.net/forums/index.php/topic,57216.0.html"
arch=('i686' 'x86_64')
license=('custom:freespace2')
depends=('tbp')
makedepends=('p7zip')
source=($pkgname-${pkgver}.7z::http://www.freespacemods.net/request.php?402)
md5sums=('5d38f414f9c8a609f11534c668477208')

build() {

  #Install the package
  7z x $pkgname-${pkgver}.7z -o$pkgdir/opt

  #Fix the permissions of the package
  find $pkgdir/opt -type f -exec chmod 644 {} + || return 1
  find $pkgdir/opt -type d -exec chmod 755 {} + || return 1
  
}

# vim:set ts=2 sw=2 et:
