# Contributor: Harry Bellemare <h.bellemare@gmail.com>
pkgname=gnudoq
_pkgname=GNUDoQ
pkgver=0.94
pkgrel=2
pkgdesc="An open source, graphical Su Doku generator and solver with printer/PDF support"
arch=('i686' 'x86_64')
url="http://www.thelemmings.net/static.php?page=GNUDoQ"
license=('GPL')
depends=('qt')
source=(http://www.thelemmings.net/projects/$_pkgname-$pkgver.tar.bz2
patches.diff)
md5sums=('237c854161a66ecf0fc4ee867d3c9d48'
         'f85adbaef2212b13abd63a24694039e8')
build() {
cd $srcdir/GNUDoku-$pkgver
patch -Np0 -i ../patches.diff
qmake $_pkgname.pro
make
install -D $_pkgname $pkgdir/usr/bin/$pkgname
install -Dm644 GNUDoku.desktop $pkgdir/usr/share/applications/$pkgname.desktop
install -Dm644 GNUDoku.png $pkgdir/usr/share/icons/$pkgname.png
}
