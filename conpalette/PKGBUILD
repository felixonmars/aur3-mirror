# Maintainer: Copycat <copycat [at] lavabit.com>

pkgname=conpalette
pkgver=0.1.5
pkgrel=1
pkgdesc="Redefine a Linux console's color palette"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~hinrik/App-ConPalette-0.1.5/bin/conpalette"
license=('GPL')
depends=('perl')
source=("http://search.cpan.org/CPAN/authors/id/H/HI/HINRIK/App-ConPalette-${pkgver}.tar.gz")
md5sums=('21ab9570cc127684ea40ef7ea8e4f2a5')

build() {
cd $srcdir/App-ConPalette-$pkgver

}

package() {
cd $srcdir/App-ConPalette-$pkgver
install -D -m755 bin/conpalette $pkgdir/usr/bin/conpalette
}
