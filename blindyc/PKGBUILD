# Maintainer: Bill Dengler <billkd314159@gmail.com>
pkgname=blindyc
pkgver=1
pkgrel=1
#epoch=
pkgdesc="Simple command line client for blindy.tv audio described television service"
arch="any"
url="http://launchpad.net/blindyc"
license=('apache license 2.0')
#groups=()
depends=(bzr mpg123)
#makedepends=()
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()#
#replaces=()
#backup=()
#options=()
#install=
#changelog=
#source=($pkgname-$pkgver.tar.gz)
#noextract=()
#md5sums=() #generate with 'makepkg -g'


package() {
mkdir -p $pkgdir/usr/bin &> /dev/null
bzr checkout lp:blindyc "$pkgdir/usr/bin"

}

# vim:set ts=2 sw=2 et:
