# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=spacearyarya
pkgver=1.0.2
pkgrel=1
pkgdesc="Third-person shooter in pseudo-3D"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?SpaceAryarya"
license=('GPL')
depends=('kxl' 'libx11')
source=("http://ftp.debian.org/debian/pool/main/s/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('0c3666630eed179d9d3c0182b6358a6f')

build() {
  cd "${srcdir}/SpaceAryarya-KXL-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/SpaceAryarya-KXL-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
