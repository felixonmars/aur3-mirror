# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=qelectrotech-devel
_varpkgname=qelectrotech
pkgver=0.3a
pkgrel=1
pkgdesc="An electric diagram editor (developpement version)"
arch=('i686' 'x86_64')
url="http://qelectrotech.tuxfamily.org/"
install='qelectrotech-devel.install'
license=('GPL2' 'CCPL:by-sa')
depends=('qt' 'shared-mime-info')
source=("http://download.tuxfamily.org/qet/tags/20120513/${_varpkgname}-${pkgver}-src.tar.gz")
md5sums=('e39b252db62120d7bf9d52422819de69')

build() {
  cd "${srcdir}/${_varpkgname}-${pkgver}-src"
  sed -i s,usr\/local,usr,g qelectrotech.pro
  sed -i s,..\/share\/mime\/,share\/mime\/,g qelectrotech.pro
  qmake
  make
}

package() {
  cd "${srcdir}/${_varpkgname}-${pkgver}-src"
  make INSTALL_ROOT="${pkgdir}" install
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"
  rm -r "${pkgdir}/share"
}
