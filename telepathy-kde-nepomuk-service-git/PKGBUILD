# Maintainer: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=telepathy-kde-nepomuk-service-git
_gitname="ktp-nepomuk-service"
pkgver=e1be620
pkgrel=1
epoch=1
pkgdesc="Nepomuk integration service for Telepathy"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/network/telepathy/ktp-nepomuk-service"
license=('GPL')
depends=('kdebase-runtime' 'telepathy-qt')
makedepends=('cmake' 'automoc4' 'git')
conflicts=('telepathy-nepomuk-service-git')
source="git://anongit.kde.org/ktp-nepomuk-service.git"
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
  #git describe --always | sed 's|-|.|g;s|v||'
}

build() {
  cd ${srcdir}

  msg "Starting make..."
  
  rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
    -DQT_MOC_EXECUTABLE=/usr/bin/moc-qt4 \
    -DQT_RCC_EXECUTABLE=/usr/bin/rcc-qt4 \
    -DQT_UIC_EXECUTABLE=/usr/bin/uic-qt4 \
    -DCMAKE_POSITION_INDEPENDENT_CODE=on

  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
