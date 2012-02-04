# $Id$
# Contributor : Peter Feigl <peter.feigl@gmail.com>

pkgname=qwo
pkgver=0.5
pkgrel=1
pkgdesc='An implementation of Quikwriting'
arch=('i686' 'x86_64')
url="http://www.nongnu.org/qwo/"
license=('GPLv2')
depends=('imlib2' 'libconfig' 'libx11')
source=(http://mirror.lihnidos.org/GNU/savannah/${pkgname}/${pkgname}-${pkgver}.tar.gz)

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make DESTDIR=${pkgdir} install
}

md5sums=('9e1f7394be0a2eb2891e915f594d5f95')
