# Mantainer: Alex Talker <alextalker at openmailbox dot org>

pkgname=qupzilla-qt5-git
pkgver=v1.8.0.r129.gc35b27e
pkgrel=1
pkgdesc="A new and very fast open source browser based on WebKit core, written in Qt Framework."
arch=('i686' 'x86_64')
url="http://qupzilla.com/index.php"
license=('GPL')
depends=( 'qt5-base' 'qt5-script' 'qt5-webengine' 'qt5-tools')
makedepends=('git')
provides=('qupzilla' 'qupzilla-git')
conflicts=('qupzilla' 'qupzilla-git')
source=(qupzilla::'git+https://github.com/QupZilla/qupzilla.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/qupzilla"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/qupzilla"
  export USE_WEBGL="true"
  export KDE_INTEGRATION="true"
  export QUPZILLA_PREFIX="/usr/"
   
  qmake-qt5
  make clean
  make
}

package() {
  cd ${srcdir}/qupzilla
  make INSTALL_ROOT="$pkgdir/" install
}
