# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=ktrafficanalyzer
pkgver=0.5.4.1
pkgrel=2
pkgdesc="KTrafficAnalyzer is meant to provide visual feedback of your current network traffic, similar to tools like DU-Meter. In addition it provides statistics with total down- and upload sums."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/KTrafficAnalyzer?content=22134"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
source=(http://sourceforge.net/projects/ktrafficanalyze/files/Releases/KTrafficAnalyzer-${pkgver}.tar.bz2)
md5sums=('5404db17dbdb10ef8b243693ada9ff1b')

build() {
  cd ${srcdir}/KTrafficAnalyzer-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake4 . 
  make clean 
  make || return 1
  make DESTDIR=$startdir/pkg/ install
  
}
