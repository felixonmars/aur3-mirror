# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=tek
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple Makefile generator for LaTeX"
arch=('i686' 'x86_64')
url="https://github.com/palmer-dabbelt/tek"
license=('GPL2')
groups=('dreamer-tools')
makedepends=('pconfigure')
depends=('xfig' 'imagemagick' 'inkscape' 'gnuplot' 'texlive-htmlxml')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('aefa1a3e0ecc365f3d65b4fbc401fe4a')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    echo "PREFIX = /usr" > Configfile.local
    echo "LANGUAGES += c" >> Configfile.local
    echo "COMPILEOPTS += -DNDEBUG" >> Configfile.local
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    pconfigure
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make D="$pkgdir" install
}
