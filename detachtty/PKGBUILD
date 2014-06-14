# Maintainer: Quinn Evans <yoshizuki@gmail.com>
# Contributor: Isaac Praveen <icylisper@gmail.com>
pkgname=detachtty
pkgver=0.9
pkgrel=4
pkgdesc="Utility that lets you run interactive programs (such as Lisp) non-interactively"
arch=any
url="http://www.cliki.net/detachtty"
license=('GPL')
depends=()
makedepends=('gcc') 
source=('ftp://ftp.linux.org.uk/pub/lisp/detachtty/detachtty_9.tar.gz')
md5sums=('85695016ec47ce0262a2a5aa2a48b577')

build() {
    cd $srcdir/detachtty-9
    make
}

package() {
   cd $srcdir/detachtty-9
   mkdir -p $pkgdir/usr/bin/
   cp -a detachtty $pkgdir/usr/bin/
   cp -a attachtty $pkgdir/usr/bin/
}
