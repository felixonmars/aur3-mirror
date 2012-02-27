# Maintainer: Chia-Wei Li <dreamcwli@gmail.com>
 
pkgname=kdeplasma-addons-applets-activitymanager-wheeled
pkgver=0.6.1
pkgrel=1
pkgdesc='Lightweight plasmoid to manage your activities effectively.'
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php?content=148508'
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/148508-activitymanager-wheeled-$pkgver.tar.gz")
md5sums=('a0eb97ca76d576071b8035443653e6bc')
 
build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake "$srcdir/activitymanager-wheeled-$pkgver" \
    -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)"
  make
}
 
package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
