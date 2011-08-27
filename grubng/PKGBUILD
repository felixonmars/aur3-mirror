# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=grubng
pkgver=1.0
pkgrel=1
pkgdesc="(Wikia's) Next Generation Web Crawling Bot"
url="http://grub.org/"
license="GPL3"
depends=('mono' 'gtk-sharp-2') 
makedepends=('nant>=0.86-2')
arch=('i686' 'x86_64')
source=("http://www.grub.org/files/$pkgname-$pkgver.tar.gz")

build() {
    export MONO_SHARED_DIR="${startdir}/src/.wabi"
    mkdir -p "${MONO_SHARED_DIR}"
    cd $startdir/src/$pkgname-$pkgver

    nant build -D:target=unix
    nant install -D:prefix=$startdir/pkg/usr
    sed -i "s/-0=all/-O=all/g" $startdir/pkg/usr/bin/grubng
    sed -i "s#@PATH@#/usr/lib#g" $startdir/pkg/usr/bin/grubng
}

md5sums=('6cb76e1c1a2ea04b9628984b2cf16a38')
