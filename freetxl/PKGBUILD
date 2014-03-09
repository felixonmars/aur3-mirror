# Maintainer: Jon Eyolfson <jon@eyolfson.com>
pkgname=freetxl
_pkgname=txl
pkgver=10.6a
pkgrel=1
pkgdesc="An XML-based TXL compiler/interpreter"
url="http://www.txl.ca/"
arch=('x86_64')
license=('custom')
makedepends=('sh')
source=("${_pkgname}${pkgver}.linux64.tar.gz")
sha1sums=('36cd81e350d1f1dacb92ff6688e6566c51ea3d44')

package() {
    cd ${srcdir}/${_pkgname}${pkgver}.linux64

    # Change the install path
    sed -i "s#^TXLBIN=.*#TXLBIN=${pkgdir}/usr/bin#" InstallTxl
    sed -i "s#^TXLLIB=.*#TXLLIB=${pkgdir}/usr/lib#" InstallTxl
    sed -i "s#^TXLMAN=.*#TXLMAN=${pkgdir}/usr/share/man/man1#" InstallTxl

    # Skip the user check
    sed -i 's#^if \[ "$USER" != "root" \]#if false#' InstallTxl

    ./InstallTxl

    # Install the FreeTXL license
    install -D -m644 COPYRIGHT.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
