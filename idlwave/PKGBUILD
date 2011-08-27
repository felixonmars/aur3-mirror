#Contributor: karnath <karnathtorjian@gmail.com>

pkgbase=idlwave
pkgname=idlwave
pkgver=6.0
pkgrel=1
arch=('any')
license=('GPL2')
url="http://idlwave.org/"
pkgdesc="Emacs interface and editing mode for IDL (interactive data language)" 
depends=('emacs')
optdepends=('gnudatalanguage: IDL (interactive data language) compatible incremental compiler')
install=idlwave.install
source=("http://idlwave.org/download/idlwave.tar.gz")
md5sums=('eea29e139ba2d3408aefb1faef2cf656')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make prefix=$pkgdir/usr
}

package() {
    cd "$srcdir/idlwave-$pkgver"
    make prefix=$pkgdir/usr infodir=$pkgdir/share/info install-all 
}


