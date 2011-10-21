# Contributor : Francois Boulogne <fboulogne@april.org>

pkgname=acidrain
pkgver=0.3.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="synchronize files between computers and keep a history of changes in them"
url="http://myacidrain.com"
license="Unknown"
depends=()
makedepends=()
source=("http://myacidrain.com/sites/all/modules/pubdlcnt/pubdlcnt.php?file=http://myacidrain.com/sites/www.myacidrain.com/files/AcidRain-$pkgver.tar__0.gz&nid=96")
md5sums=('4c419bd76e262773adbbaae0c0e97c7a')

build() {
  cd AcidRain-$pkgver
  qmake
  make
  make install INSTALL_ROOT=%$pkgdir
}
