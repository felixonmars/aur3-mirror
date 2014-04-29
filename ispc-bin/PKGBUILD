# $Id: $
# Contributor: J. Berger <jeberger@free.fr>

pkgname=ispc-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Intel SPMD program compiler"
arch=('i686' 'x86_64')
url="http://ispc.github.com/"
license=('BSD')
depends=("clang" "libtinfo")
source=("https://github.com/downloads/ispc/ispc/ispc-v${pkgver}-linux.tar.gz")
source=("ispc-v${pkgver}-linux.tar.gz::https://sourceforge.net/projects/ispcmirror/files/v${pkgver}/ispc-v${pkgver}-linux.tar.gz/download")
md5sums=('158d867026d74b58aae453efd953c6cc')

package() {
   cd "${srcdir}/ispc-v${pkgver}-linux"
   install -D -m755 ispc "${pkgdir}/usr/bin/ispc"
   install -d -m755 "${pkgdir}/usr/share/doc/ispc-${pkgver}"
   install -D -m644 *.html "${pkgdir}/usr/share/doc/ispc-${pkgver}"
   install -d -m755 "${pkgdir}/usr/share/doc/ispc-${pkgver}/css"
   install -D -m644 css/* "${pkgdir}/usr/share/doc/ispc-${pkgver}/css"
}
