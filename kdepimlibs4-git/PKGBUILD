pkgname=kdepimlibs4-git
_gitname=kdepimlibs
pkgver=v4.10.2.309.gbe213b8
pkgrel=1
pkgdesc='A library to access Open Collaboration Service providers'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('kdelibs4-git' 'gpgme' 'akonadi-git' 'libical' 'prison-git' 'qjson')
makedepends=('cmake' 'automoc4' 'boost' 'cyrus-sasl' 'git')
conflicts=('kdepimlibs')
provides=('kdepimlibs')
groups=('kde-git')
source=('git://anongit.kde.org/kdepimlibs')
md5sums=('SKIP')
install=kdepimlibs4-git.install

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $srcdir
  
  msg "GIT checkout done"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  mkdir $srcdir/build
  cd $srcdir/build
  cmake $srcdir/$_gitname -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
