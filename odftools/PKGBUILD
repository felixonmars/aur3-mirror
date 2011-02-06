# sam may <sam.m4y@gmail.com>

pkgname=odftools
pkgver=0.1
pkgrel=1
pkgdesc="A set of conversion tools for OpenDocument files"
url="http://opendocumentfellowship.com/projects/odftools"
arch=('i686' 'x86_64')
license=('Apache' 'LGPL')
depends=('perl' 'libxslt' 'links')
optdepends=('elinks: an alternative text-mode browser for odfread' \
            'lynx:   an alternative text-mode-browser for odfread')
source=('http://opendocumentfellowship.com/~daniel/odftools-0.1.tgz')
md5sums=('c7b2d0316b66fdb988dcf618a2bb1021')

build() {
    cd $startdir/src/odftools-$pkgver
    msg "Patching makefile..."
    patch -p0 < $startdir/Makefile.patch
    make
    make install PREFIX=$pkgdir/usr
}
