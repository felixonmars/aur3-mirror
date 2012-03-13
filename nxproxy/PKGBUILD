# Contributor: Gerhard Brauer <gerbra@archlinux.de>
# Contributor: Richard Murri <admin@richardmurri.com>
# Contributor: Markus Opitz <mastero23 at gmail dot com>
# Maintainer: Milan Knížek <knizek@volny.cz>
pkgname=nxproxy
pkgver=3.5.0.12
pkgrel=1
pkgdesc="NX compression proxy"
arch=(i686 x86_64)
url="http://www.x2go.org/"
license=('GPL')
depends=('nxcomp>=3.5.0' 'gcc-libs')
conflicts=("${pkgname}-x2go-git")
groups=('x2go' 'alts')
source=("http://code.x2go.org/releases/source/nx-libs/nx-libs_${pkgver}-full.tar.gz")

build() {
  cd "$srcdir/nx-libs_${pkgver}"
#  patch -p1 < ../nxcomp_Png.cpp.patch
  make || return 1
}

package() {
  cd "$srcdir/nx-libs_${pkgver}/${pkgname}"

  install -m 755 -d "$pkgdir/usr/bin/"
  install -m 755 nxproxy "$pkgdir/usr/bin/"

  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 "../doc/changelog" "${pkgdir}/usr/share/doc/${pkgname}/changelog.DEBIAN"
  install -m 644 "../doc/README.NX-redistributed" "${pkgdir}/usr/share/doc/${pkgname}/README.NX-redistributed"
}

md5sums=('a2011e034a318016cf2260c30a567301')
