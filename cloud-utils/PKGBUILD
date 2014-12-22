# Maintainer: Super Bo <supernbo@gmail.com>
pkgname=cloud-utils
pkgver=0.27
pkgrel=1
pkgdesc="A useful set of utilities for interacting with a cloud"
arch=(any)
url="https://launchpad.net/cloud-utils"
license=('GPL3')
groups=()
depends=(python2 python2-yaml python2-paramiko ca-certificates e2fsprogs file euca2ools util-linux wget gnupg cdrkit)
makedepends=()
optdepends=(gptfdisk)
backup=()
options=()
install=
source=(https://launchpad.net/$pkgname/trunk/0.27/+download/$pkgname-$pkgver.tar.gz arch-compatible.patch)
md5sums=('b9ebfc4f13f65bc58c49fc57c0703cc8'
         'f58e827a7ddd46a694fca23610e3810e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < ../../arch-compatible.patch
	make build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}

