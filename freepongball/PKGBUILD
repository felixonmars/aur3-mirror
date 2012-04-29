# Maintainer: Sabaku
pkgname=freepongball
pkgbase=freepongball
pkgver=20120429
pkgrel=1
pkgdesc="Free Pong game like"
arch=('any')
license=('GPL')
depends=('gtkmm')
optdepends=()
makedepends=('git')
provides=('freepongball')
conflicts=('freepongball')
url=(https://github.com/SabakuRou/FreePongBall)
source=()
md5sums=()

_gitroot=https://SabakuRou@github.com/SabakuRou/FreePongBall.git
_gitname=FreePongBall

build(){
  cd ${srcdir}
  git clone $_gitroot
  msg "Starting make..."
  cd FreePongBall/src
  make 
}

package(){
	cd "${srcdir}/FreePongBall/src"
	make DESTDIR="$pkgdir" install
	install -d -m755 src/ ${pkgdir}/usr/share/${pkgbase}
	cp -ar ../src ${pkgdir}/usr/share/${pkgbase}
}
