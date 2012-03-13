# Contributor: Gerhard Brauer <gerbra@archlinux.de>
# Contributor: Richard Murri <admin@richardmurri.com>
# Contributor: Markus Opitz <mastero23 at gmail dot com>
# Maintainer: Milan Knížek <knizek@volny.cz>
pkgname=nxcompext
pkgver=3.5.0.12
pkgrel=1
pkgdesc="NX X11 protocol compression extensions library"
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL2')
depends=('libjpeg' 'libpng' 'gcc-libs' 'nxcomp>=3.5.0')
conflicts=("${pkgname}-x2go-git")
groups=('x2go' 'alts')
install=${pkgname}.install
source=("http://code.x2go.org/releases/source/nx-libs/nx-libs_${pkgver}-full.tar.gz")

build() {
  cd "$srcdir/nx-libs_${pkgver}"
  sed --in-place=orig \
    's!test -d nxproxy \&\& cd nxproxy \&\& autoconf \&\& ./configure \&\& make!# removed line here!' \
    Makefile
#  patch -p1 < ../nxcomp_Png.cpp.patch
  make || return 1
}

package() {
  cd "$srcdir/nx-libs_${pkgver}/${pkgname}"

  install -m 755 -d "$pkgdir/usr/lib/nx/"
  install -m 644 libXcompext.so.3.5.0 "$pkgdir/usr/lib/nx/"
  ln -s libXcompext.so.3.5.0 "$pkgdir/usr/lib/nx/libXcompext.so.3"
  ln -s libXcompext.so.3.5.0 "$pkgdir/usr/lib/nx/libXcompext.so"
  ln -s libXcompext.so.3.5.0 "$pkgdir/usr/lib/libXcompext.so.3"
  ln -s libXcompext.so.3.5.0 "$pkgdir/usr/lib/libXcompext.so.3.5.0"
#  install -m 644 libXcompext.a "$pkgdir/usr/lib/nx/"

  install -m 755 -d "$pkgdir/usr/include/nx/"
  install -m 644 NX*.h "$pkgdir/usr/include/nx/"

  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 "../doc/changelog" "${pkgdir}/usr/share/doc/${pkgname}/changelog.DEBIAN"
  install -m 644 "../doc/README.NX-redistributed" "${pkgdir}/usr/share/doc/${pkgname}/README.NX-redistributed"
}

md5sums=('a2011e034a318016cf2260c30a567301')
