# Maintainer: crass00 <crass00 @t hotmail dot com>
 
pkgname='jpegrescan-kud-git'
pkgver=20141209
pkgrel=1
pkgdesc='JPEGrescan is a perl script that uses jpeg tools to optimize jpeg compression by micro-managing some of the compression math based on research into some of the 
most common parameters.'
arch=('any')
url='http://github.com/kud/jpegrescan'
license=('GPL')
provides=('jpegrescan')
depends=("perl-file-slurp")
source=("https://raw.github.com/kud/jpegrescan/master/jpegrescan"
        "https://raw.github.com/kud/jpegrescan/master/README.md")
md5sums=('SKIP'
         'SKIP')
 
package() {
    cd "${srcdir}"
    install -Dm775 jpegrescan "${pkgdir}/usr/bin/jpegrescan"
    install -Dm644  README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
