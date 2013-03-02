# Contributer: giacomogiorgianni@gmail.com 

pkgname=whiteelephant
pkgver=1.6.2
pkgrel=2
pkgdesc="This is a simple animation line testing software written in C++ with Qt toolkit."
arch=(any)
url="https://sites.google.com/site/crostiapp/"
license=('GPL')
depends=('qt4')
source=("http://whiteelephant.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('426c46175fb9648206c5c896a910e9c7')



build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  qmake-qt4 
   #  $pkgname.pro -r -config release \
   # "CONFIG+=LINUX_INTEGRATED" \
   # "INSTALL_ROOT_PATH=$pkgdir/usr/" \
   # "LOWERED_APPNAME=$pkgname"

  make
  make INSTALL_ROOT=${pkgdir} install
}