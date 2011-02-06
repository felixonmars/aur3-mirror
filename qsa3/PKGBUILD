# Contributor: daelstorm <daelstorm@gmail.com>
# Contributor: imachine <m.jedrasik@gmail.com>

pkgname=qsa3
pkgver=1.1.5
pkgrel=3
pkgdesc="Qt Script for Applications for Qt3" 
arch=('i686' 'x86_64')
url=(http://trolltech.com/products/qt/addon/qsa/)
license="GPL2"
depends=('qt3')
source=("ftp://ftp.trolltech.com/qsa/source/qsa-x11-free-$pkgver.tar.gz")
md5sums=('002470ec15a06b7875328ed57c9be474')

build() {
  cd $startdir/src/qsa-x11-free-$pkgver
  export PATH=$QTDIR/bin:$PATH
  ./configure -prefix /opt/qt
  make || return 1
  make install INSTALL_ROOT=$startdir/pkg 
}
