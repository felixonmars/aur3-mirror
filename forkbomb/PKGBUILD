# Contributor: skydrome <skydrome@i2pmail.org>
# Maintainer: skydrome <skydrome@i2pmail.org>

pkgname=forkbomb
_branch=master
pkgver=1.4
pkgrel=1
pkgdesc="Stress test tool"
arch=('i686' 'x86_64' 'armv6h')
url="http://home.tiscali.cz/cz210552/forkbomb.html"
license=('PD')
source=("http://home.tiscali.cz/cz210552/distfiles/forkbomb-$pkgver.tar.gz")
sha256sums=('729b937e44c8408ad743fb243ee98580d01c9223a6716e8b25e0e1099097f1b6')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -d $pkgdir/usr/bin
    install forkbomb $pkgdir/usr/bin
    install -d $pkgdir/usr/share/man/man8
    install forkbomb.8 $pkgdir/usr/share/man/man8
}
