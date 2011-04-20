# Maintainer: Athurg <athurg@gooth.cn>

pkgname=diashapes
pkgver=0.2.2
pkgrel=1
pkgdesc="A tool to download and installer dia shapes"
arch=('i686' 'x86_64')
url="http://soureceforge.net/projects/dia-installer/"
license=('GPL')
depends=('mono')
makedepends=('intltool')
options=('!libtool')
source=("http://nchc.dl.sourceforge.net/project/dia-installer/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

md5sums=('c55e21600dbde53fadb2d356d025aa87')
