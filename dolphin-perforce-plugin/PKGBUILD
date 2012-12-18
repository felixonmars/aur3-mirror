
pkgname=dolphin-perforce-plugin
pkgver=0.3
pkgrel=1
pkgdesc="Simple Perforce version control plugin for Dolphin inspiered by the version control plugins kdesdk-dolphin-pligins"
arch=('i686' 'x86_64')
url="https://opendesktop.org/content/show.php/dolphin-perforce-plugin?content=155919"
license=('GPL')
depends=('kdebase-lib>=4') 
makedepends=('cmake' 'automoc4')
source=(http://kde-apps.org/CONTENT/content-files/155919-$pkgname.tar.gz)
md5sums=('3cc29467862ee060ccc16d93bd5eeeee')

build() {
  cd "${srcdir}/$pkgname"
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make && make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
