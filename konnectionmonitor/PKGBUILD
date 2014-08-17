# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=konnectionmonitor
pkgver=0.2
pkgrel=1
pkgdesc="Monitor incoming and outgoing TCP connections"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KonnectionMonitor?content=140883"
license=('GPL')
depends=('qt4')
makedepends=('cmake')
conflicts=('konnectionmonitor-git')
install="${pkgname}.install"
source=("https://gitorious.org/${pkgname}/${pkgname}/archive/be0f73b08edf2098f16beb91f75428751cc42e48.tar.gz")
md5sums=('9a1808eb5cb23f083ce4bbe0b7d7f85b')

prepare() {
  if [[ -d build ]]
  then
    rm -rf build
  fi
   mkdir build
}

build() {
  cd "${srcdir}/build"
  cmake ../${pkgname}-${pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
