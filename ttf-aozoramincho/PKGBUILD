# Maintainer: kusanaginoturugi <kusanaginoturugi@gmail.com>

pkgname=ttf-aozoramincho
pkgver=0.1
_pkgver=${pkgver:1}
pkgrel=1
pkgdesc="Japanese Font family based on the IPA Fonts with 7 Weight"
arch=('any')
url="http://blueskis.wktk.so/AozoraMincho/"
license=('custom')
install=ttf.install
source=(http://blueskis.wktk.so/AozoraMincho/archive/v${pkgver}/aozoramincho-readme-ttf.zip)
md5sums=('c80f6005c67d81e66b000c872ae6b672')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 aozoramincho-readme-ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 aozoramincho-readme-ttf/IPA_PMincho/*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 aozoramincho-readme-ttf/licence.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.html
}
