# Maintainer: Frikilinux <frikilinux at gmail.com>
# Contributor: Coues Ludovic <couesl@gmail.com>
pkgname=devinfo
pkgver=0.6.0
pkgrel=3
pkgdesc="An hardware device information KCM"
arch=('i686' 'x86_64')
url=("http://kde-apps.org/content/show.php/Device+Information+KCM?content=113365")
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/113365-kcm_devinfo0.6.tar.bz2")
md5sums=('f4093b1e0d177bb72c084312d93acda8')

build() {
  cd "${srcdir}/kcm_devinfo"
  cmake -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_SKIP_RPATH=ON \
  -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DQT_QMAKE_EXECUTABLE=qmake-qt4
}
package() {
  cd "${srcdir}/kcm_devinfo"
  make DESTDIR="${pkgdir}" install
}
