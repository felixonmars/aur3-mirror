# Maintainer: Taylor Venable <taylor@metasyntax.net>

pkgname='critcl'
pkgver='3.1.8'
pkgrel=1
pkgdesc='Critcl lets you easily embed C code in Tcl'
arch=('i686' 'x86_64')
url='http://andreas-kupries.github.com/critcl/'
license=('BSD')
depends=('tcl>=8.6.0' 'tcllib')
source=("https://github.com/andreas-kupries/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('aef270a3cba974b8c890966e55479514beaefcc4bb6ca76ed42054268adc8eb6')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    tclsh build.tcl install "$pkgdir/usr/lib/tcl8.6"
}
