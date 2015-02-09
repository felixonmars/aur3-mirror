# Maintainer: Hendrik Söhnholz <henne-s at gmx dot de>

pkgname=dreamass-git
pkgver=r46.ba43fe1
pkgrel=1
pkgdesc="A cross-assembler targetting the C64."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/rrtools/"
license=('GPL')
depends=('glibc')
makedepends=('git' 'help2man' 'texinfo' 'texi2html')
checkdepends=('valgrind')
install=dreamass-git.install
provides=('dreamass')
source=("git+https://github.com/docbacardi/dreamass.git")
md5sums=('SKIP')
pkgver() {
    cd "$srcdir/dreamass"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
	   "$(git rev-parse --short HEAD)"
}
build() {
    cd dreamass
    make dreamass
    make dreamass.1.gz doc
}
check() {
    sed -i 's/^DREAMASS = .*$/DREAMASS = ..\/dreamass/' \
	"$srcdir/dreamass/test/Makefile"
    cd dreamass
    make test
}
package() {
    install -m 0755 -D "$srcdir/dreamass/dreamass" "$pkgdir/usr/bin/dreamass"
    install -m 0644 -D "$srcdir/dreamass/dreamass.1.gz" \
	    "$pkgdir/usr/share/man/man1/dreamass.1.gz"
    install -m 0644 -D "$srcdir/dreamass/docs/dreamass.info.gz" \
	    "$pkgdir/usr/share/info/dreamass.info.gz"
    install -m 0644 -D "$srcdir/dreamass/docs/dreamass.html" \
	    "$pkgdir/usr/share/doc/$pkgname/dreamass.html"
    install -m 0644 -D "$srcdir/dreamass/docs/dreamass.txt" \
	    "$pkgdir/usr/share/doc/$pkgname/dreamass.txt"
}
