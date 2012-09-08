pkgname=libkappmenu
pkgver=0.9.8
pkgrel=1
pkgdesc="Lib interface for kded-appmenu dbus menu registrar"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kdereview/kded-appmenu'
license=('GPL')
depends=('kded-appmenu')
makedepends=('cmake' 'automoc4')
conflicts=('libkappmenu-git')
source=("http://kde-apps.org/CONTENT/content-files/153883-libkappmenu-$pkgver.tar.gz")
sha1sums=('70ffec04f40f0e2b8eb73231e5951a158a4d19f1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -fr build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
