# Maintainer: Taylor Venable <taylor@metasyntax.net>

pkgname='mod_rivet'
pkgver='2.1.1'
pkgrel=1
pkgdesc='Apache module for Tcl scripting and templating'
arch=('x86' 'x86_64')
url='http://tcl.apache.org/rivet/'
license=('Apache')
depends=('apache' 'tcl')
source=("http://mirrors.ibiblio.org/apache/tcl/rivet/rivet-${pkgver}.tar.gz")
sha256sums=('d85071e22227544eae90a8cc6259617c0396c08fb2071e24a0c82faa79f3fcc3')

build(){
    cd ${srcdir}/rivet-${pkgver}
    ./configure --with-apache=/usr
    make
}

package() {
    cd ${srcdir}/rivet-${pkgver}
    make DESTDIR="$pkgdir" install
}
