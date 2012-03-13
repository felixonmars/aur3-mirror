# Contributor: Gerhard Brauer <gerbra@archlinux.de>
# Contributor: Richard Murri  <admin@richardmurri.com>
# Contributor: Marc Cousin <cousinmarc@gmail.com>
# Contributor: Markus Opitz <mastero23 at gmail dot com>
# Maintainer: Milan Knížek <knizek@volny.cz>

pkgname=nxcomp
pkgver=3.5.0.12
pkgrel=1
pkgdesc="NX compression library"
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL2')
depends=('libjpeg' 'libpng' 'gcc-libs' 'nx-x11>=3.5.0')
conflicts=("${pkgname}-x2go-git")
groups=('x2go' 'alts')
install=${pkgname}.install
source=("http://code.x2go.org/releases/source/nx-libs/nx-libs_${pkgver}-full.tar.gz")

build() {
  cd "$srcdir/nx-libs_${pkgver}"
  sed --in-place=orig \
    -e 's!test -d nxproxy \&\& cd nxproxy \&\& autoconf \&\& ./configure \&\& make!# removed line here!' \
    -e 's!= /usr/local!= /usr!' \
    -e 's!echo "Running ldconfig!#echo "Running ldconfig!' \
    Makefile

#  patch -p1 < ../nxcomp_Png.cpp.patch
  make || return 1
}

package() {
  cd "$srcdir/nx-libs_${pkgver}/nxcomp"

  install -m 755 -d "$pkgdir/usr/include/nx/"
  install -m 644 NX*.h MD5.h "$pkgdir/usr/include/nx/"

# MK: DEBIAN package is a bit different here
  install -m 755 -d "$pkgdir/usr/lib/nx/"
  install -m 644 libXcomp.a "$pkgdir/usr/lib/nx/"
  install -m 644 libXcomp.so.3.5.0 "$pkgdir/usr/lib/nx/"
  ln -s libXcomp.so.3.5.0 "$pkgdir/usr/lib/nx/libXcomp.so.3"
  ln -s libXcomp.so.3.5.0 "$pkgdir/usr/lib/nx/libXcomp.so"

  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 "../doc/changelog" "${pkgdir}/usr/share/doc/${pkgname}/changelog.DEBIAN"
  install -m 644 "../doc/README.NX-redistributed" "${pkgdir}/usr/share/doc/${pkgname}/README.NX-redistributed"
}

md5sums=('a2011e034a318016cf2260c30a567301')
