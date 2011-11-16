# Maintainer: John Regan <saxindustries@gmail.com>

pkgname=cdirip
pkgver=0.6.3.1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A tool to extract sessions out of discjuggler images"
url="http://dchelp.dcemulation.org/downloads/"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
source=("http://dchelp.dcemulation.org/downloads/${pkgname}-0.6.3-mod-v1-src.zip")
md5sums=('9ac760b5701156681bf0c3de587fc40c')
install='cdirip.install'

build() {
  cd "${srcdir}"
  make
}


package() {
  cd "${srcdir}"
 
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/share/doc/cdirip"

  install -m755 cdirip "${pkgdir}/usr/bin"
  install -m755 readme.txt "${pkgdir}/usr/share/doc/cdirip/README"
}
