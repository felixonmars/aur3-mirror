# Maintainer: Nyutag <tanguy at metatux dot fr>
pkgname=catchchallenger-mmorpg-single-server-git
pkgver=latest
pkgrel=1
pkgdesc="openSource oldschool MMORPG"
arch=('i686' 'x86_64')
url="http://catchchallenger.first-world.info/"
license=('GPL')
depends=('qt5-multimedia' 'qt5-script')
makedepends=('git')
_gitroot="git://github.com/alphaonex86/CatchChallenger.git"
source=('catchchallenger-single-server' "${pkgname}"::"${_gitroot}")
md5sums=('d822325d1de84b1a3ab88a36e46a966d'
         'SKIP')
 
build() {
  cd "${srcdir}/${pkgname}/client/single-server/"
  qmake *.pro
  make
}
 
package() {
  install -D -m755 "${srcdir}/${pkgname}/client/single-server/catchchallenger-single-server" "$pkgdir/usr/share/catchchallenger-mmorpg-single-server/catchchallenger-single-server"
  install -D -m755 "${srcdir}/catchchallenger-single-server" "$pkgdir/usr/bin/catchchallenger-single-server"
}
