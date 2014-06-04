# Maintainer: Nyutag <tanguy@metatux.fr>
pkgbase=catchchallenger-mmorpg-git
pkgname=${pkgbase}-single-player-git
pkgver=0
pkgrel=1
pkgdesc="openSource oldschool MMORPG"
arch=('i686' 'x86_64')
url="http://catchchallenger.first-world.info/"
license=('GPL')
depends=('qt5-multimedia')
makedepends=('git')
_gitroot="git://github.com/alphaonex86/CatchChallenger.git"
provides=("${pkgbase}")
conflicts=("${pkgbase}")
source=("${pkgname}"::"${_gitroot}")
md5sums=('SKIP')
 
build() {
  cd "${srcdir}/${pkgname}/client/single-player/"
  qmake *.pro
  make
}
 
package() {
  cd "${srcdir}/${pkgname}/client/single-player/"
  mkdir -p "$pkgdir/usr/share/${pkgname}"
  mkdir -p "$pkgdir/usr/bin"
  cp catchchallenger-single-player "$pkgdir/usr/share/${pkgname}/"
  echo "cd /usr/share/${pkgname} && ./catchchallenger-single-player" > "$pkgdir/usr/bin/catchchallanger-single-player"
  chmod 0777 ${pkgdir}/usr/bin/catchchallanger-single-player
  echo "***Download the database folder in /usr/share/${pkgname}/***"
  echo "***If catchchallenger-datapack is broken, you can find a nonfree one at http://pkmn-i2p.first-world.info/datapack-pkmn.tar.xz***"
}