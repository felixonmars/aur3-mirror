# Maintainer: Walid Ziouche <01walid@gmail.com>
pkgname=qutrub
pkgver=1.1
pkgrel=1
pkgdesc="Arabic verbs conjugator"
url="http://qutrub.arabeyes.org/"
license=('GPL')
groups=('arabic-extra-tools')
depends=('python2-pyqt')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/qutrub-src-1.1.tar.bz2 ${pkgname} ${pkgname}.desktop)
md5sums=('ef99ee1a47fff20a33295e762df40d17'
		 '96a4a07eb4d16fa6c5225e72843372e6'
		 '9bab9e5210f1008b6ff427a699dbadb2')
arch=('any')

build() {
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/{pixmaps,applications}/
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  cp ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  chmod +x ${pkgdir}/usr/bin/${pkgname}
  cp ${srcdir}/images/qaf.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  cp -r ${srcdir}/* ${pkgdir}/opt/${pkgname}/
}
# vim:set ts=2 sw=2 et:
