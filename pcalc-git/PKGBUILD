pkgname=pcalc-git
pkgver=r60.181d60d
pkgrel=3

pkgdesc='A command-line programmers calculator handling HEX/DEC/OCT/BIN.'
url='http://pcalc.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('flex')
makedepends=('git')

provides=('pcalc')
conflicts=('pcalc')

source=('git://git.code.sf.net/p/pcalc/code')

md5sums=('SKIP')

pkgver() {
    cd code
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd code
    make
}

check() {
    cd code
    make check
}

package() {
    cd code
    make DESTDIR="$pkgdir" install
    install -Dm644 README "$pkgdir"/usr/share/doc/pcalc/README
}
