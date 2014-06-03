# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
pkgname=r-vimcom.plus
pkgver=0.9
pkgrel=93
pkgdesc="R server for communication via vim-r"
arch=('i686' 'x86_64')
url="http://www.lepem.ufc.br/jaa/vimcom.plus.html"
depends=('r' 'libx11')
source=("http://www.lepem.ufc.br/jaa/vimcom.plus_${pkgver}-${pkgrel}.tar.gz")
license=('unknown')

build() {
    mkdir -p $pkgdir/usr/lib/R/library
    cd $srcdir
    R CMD INSTALL -l $pkgdir/usr/lib/R/library ./vimcom.plus 
}

md5sums=('b67376e9749e16494e5ea3cfa183f8b6')
