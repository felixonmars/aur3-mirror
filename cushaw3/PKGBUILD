# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=cushaw3
pkgver=3.0.3
pkgrel=1
pkgdesc="Sensitive and accurate gapped short-read alignment"
arch=("i686" "x86_64")
url="http://cushaw3.sourceforge.net"
license=("Unknown")
source=("http://downloads.sourceforge.net/project/cushaw3/cushaw3-v3.0.3.tar.bz2")
sha1sums=("4a9454009423db6a658cc8d08dce604557a10a10")

prepare() {
    # Compiling with dynamic linking
    sed -i 's/-static//' $srcdir/cushaw3-v${pkgver}/Makefile
}

build() {
    cd "$srcdir/cushaw3-v${pkgver}"

    make
}

package() {
    cd "$srcdir/cushaw3-v${pkgver}"

    install -Dm755 cushaw3 "$pkgdir/usr/bin/cushaw3"
}
