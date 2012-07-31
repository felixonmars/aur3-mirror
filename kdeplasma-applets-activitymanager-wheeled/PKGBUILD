# Maintainer: Chia-Wei Li <dreamcwli@gmail.com>
 
pkgname=kdeplasma-applets-activitymanager-wheeled
pkgver=0.6.2
pkgrel=1
pkgdesc='Lightweight plasmoid to manage your activities effectively.'
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php?content=148508'
license=('GPL')
depends=('kdebase-workspace')
conflicts=('kdeplasma-applets-activitymanager')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/148508-activitymanager-wheeled-$pkgver.tar.gz")
md5sums=('8a44996979a19223ba8066bf28220050')
 
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
