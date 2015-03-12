pkgname=libspiro-git
pkgver=0.2.r15.g58e9b7d
pkgrel=1

pkgdesc='Library for drawing bézier splines.'
url='https://github.com/fontforge/libspiro'
arch=('i686' 'x86_64')
license=('GPL3')

provides=('libspiro')
conflicts=('libspiro')

source=('git://github.com/fontforge/libspiro')

md5sums=('SKIP')

pkgver() {
    cd libspiro
    git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
    cd libspiro
    autoreconf -fiv
    ./configure --prefix=/usr
}

package() {
    cd libspiro
    make DESTDIR="$pkgdir" install
}
