# Maintainer: Chipsterjulien <julien.chipster_at_gmail.com>

pkgname=qelectrotech-v3
_varpkgname=qelectrotech
pkgver=0.3
pkgrel=1
pkgdesc="An electric diagram editor (developpement version)"
arch=('i686' 'x86_64')
url="http://qelectrotech.tuxfamily.org/"
install='qelectrotech-devel.install'
license=('GPL2' 'CCPL:by-sa')
depends=('qt4' 'shared-mime-info')
source=("http://download.tuxfamily.org/qet/tags/20130928/${_varpkgname}-${pkgver}-src.tar.gz")
md5sums=('4a7b9b01dcde4b7fcb814ec621d037ad')

build() {
  cd "${srcdir}/${_varpkgname}-${pkgver}-src"
  sed -i s,usr\/local,usr,g qelectrotech.pro
  sed -i s,..\/share\/mime\/,share\/mime\/,g qelectrotech.pro
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${_varpkgname}-${pkgver}-src"
  make INSTALL_ROOT="${pkgdir}" install
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"
  rm -r "${pkgdir}/share"
}
