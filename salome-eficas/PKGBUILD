# Maintainer: Michele Mocciola <mickele>

pkgname=salome-eficas
pkgver=2014.2
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - EFICAS Module"
url="http://www.code-aster.org/V2/spip.php?article295"
depends=('salome-gui>=7.4.0' 'salome-gui<7.5.0' 'eficas>=7.4.0')
makedepends=()
arch=('i686' 'x86_64')
license=('LGPL')
source=("http://www.code-aster.org/FICHIERS/SALOME-MECA-2014.2-LGPL-1.tgz" "${pkgname}.profile")

_installdir=/opt/salome/eficas

prepare() {
  cd "$srcdir"

  tail --lines=+597 SALOME-MECA-2014.2-LGPL.run > extracted.tar.gz
  tar xzf extracted.tar.gz
}

build() {
  cd "${srcdir}"
  
}

package() {
  cd "${srcdir}/V2014_2/modules/EFICAS_V7_4_0"
  install -d -m755 "${pkgdir}${_installdir}"
  cp -rp * "${pkgdir}${_installdir}/"
  
  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}/etc/salome/profile.d/${pkgname}.sh"

}
md5sums=('8594f2096ceddb5b8485a2bdb096fbd8'
         'c51b75243a0bc3a991c86356233c6f71')
