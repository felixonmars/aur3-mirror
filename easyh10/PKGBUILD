# Maintainer: peshane <peshane@free.fr>
# Maintainer: Nathan O <ndowens.aur at gmail dot com>

pkgname=easyh10
pkgver=1.5
pkgrel=5
pkgdesc="An open source project for the development of a software suite for iRiver H10 digital audio players"
arch=('i686' 'x86_64')
url="http://easyh10.sourceforge.net/"
license=('GPL')
depends=('libid3tag')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('167f42d1781714b0f83df4619f421a51')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man 
  make 
  make DESTDIR=${pkgdir} install
}
