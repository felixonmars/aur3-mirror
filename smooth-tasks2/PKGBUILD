# Maintainer: laloch <lalochcz@gmail.com>

pkgname=smooth-tasks2
_realname=smooth-tasks
pkgver=20130824
_realver=2013-08-24
pkgrel=1
pkgdesc="A taskbar replacement Plasmoid with window peeking similar to Windows 7"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Smooth+Tasks+2?content=148813"
depends=('kdebase-workspace>=4.8.0')
conflicts=('smooth-tasks')
provides=('smooth-tasks')
makedepends=('cmake' 'automoc4' 'gcc')
source=("http://beonis.fr/${_realname}-v${_realver}.tar.gz")
license=('GPL')
md5sums=('ca933c7e15a32692023daebfdd15cceb')

build() {
  rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build
#  cmake ${srcdir}/${pkgname} \
  cmake ${srcdir}/smooth-tasks2 \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=$pkgdir install
}
