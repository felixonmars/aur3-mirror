# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=onscripter-tools
pkgver=20100915
pkgrel=4
pkgdesc="Cross-platform builds of programs for packing/unpacking NScr script files and extracting/converting/creating NSA, NS2 and SAR archives"
arch=('i686' 'x86_64')
url="http://onscripter.unclemion.com/"
license=('GPL')
depends=('gcc-libs')

if [[ "$CARCH" == "i686" ]]; then
  source=("http://onscripter.unclemion.com/pub/onscr/onscrtools-linux-i386-${pkgver}.tar.bz2")
else
  source=("http://onscripter.unclemion.com/pub/onscr/onscrtools-linux-x86_64-${pkgver}.tar.bz2")
fi

if [ "$CARCH" == "i686" ]; then
  md5sums=('40f8138c5706314d30add71f6805e747')
else
  md5sums=('54f76c4919c69dc6a38982d9f8db65a4')
fi

package() {
  if [ "$CARCH" == "i686" ]; then
    cd "${srcdir}/onscrtools-linux-i386-${pkgver}/bin"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 * "${pkgdir}/usr/bin"

    cd "${srcdir}/onscrtools-linux-i386-${pkgver}/man"
    install -dm755 "${pkgdir}/usr/share/man/man1"
    install -m644 * "${pkgdir}/usr/share/man/man1"

    install -D -m644 "${srcdir}/onscrtools-linux-i386-${pkgver}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  else
    cd "${srcdir}/onscrtools-linux-x86_64-${pkgver}/bin"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 * "${pkgdir}/usr/bin"

    cd "${srcdir}/onscrtools-linux-x86_64-${pkgver}/man"
    install -dm755 "${pkgdir}/usr/share/man/man1"
    install -m644 * "${pkgdir}/usr/share/man/man1"

    install -D -m644 "${srcdir}/onscrtools-linux-x86_64-${pkgver}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  fi
}

# vim:set ts=2 sw=2 et:
