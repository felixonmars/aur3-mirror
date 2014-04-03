# Maintainer: Ricardo Band <me@xengi.de>
pkgname=shell
pkgver=1.0.1
pkgrel=1
pkgdesc="Easily connect to defined servers with SSH or MOSH."
url="https://github.com/XenGi/shell"
arch=('any')
license=('MIT')
depends=('python' 'python-docopt')
source=("https://github.com/XenGi/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('a716188290d333938d6a37a37f10dca2c4e398ef')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin/"
    install -m755 shell "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
