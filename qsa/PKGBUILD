# Contributor: Zhukov Pavel <gelios@gmail.com>
# Contributor: SeeSchloss <seeschloss@seos.fr>
pkgname=qsa
pkgver=1.2.3
pkgrel=1
pkgdesc="Trolltech's Qt Script for Applications (QSA) is scripting support for Qt"
url="http://www.trolltech.com/products/qsa/index.html"
arch=('i686' 'x86_64')
depends=('qt4')
license=('GPL')
source=("ftp://ftp.trolltech.com/qsa/source/qsa-x11-opensource-$pkgver.tar.gz")
md5sums=('c7a43414eeae28e0864afc1caa638b30')

build() {
  cd $startdir/src/qsa-x11-opensource-$pkgver
  ./configure -prefix /opt/qt
  make || return 1
  make install INSTALL_ROOT=$startdir/pkg
}
