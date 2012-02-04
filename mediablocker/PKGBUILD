# Author: Bartosz SKOTAREK <bzskotarek@gmail.com> <http://bartoszskotarek.tk/>

pkgname=mediablocker
pkgver=1.0
pkgrel=1
pkgdesc="Program limiting access to the system"
arch=(i686 x86_64)
license=('GPL')
depends=('qt>=4.7')
url="http://bartoszskotarek.tk/mediablocker.html"
source=(http://bartoszskotarek.tk/pliki/${pkgname}-${pkgver}.tar.gz)
md5sums=('7d2fdf2e4ee945e444408fa4f76ebc62')

build() { 
  cd ${srcdir}
  
  qmake || return 1
  make || return 1
  make INSTALL_ROOT=$pkgdir install
}

