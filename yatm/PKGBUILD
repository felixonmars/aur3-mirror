# Maintainer: franck_v <franck.vdl gmail com>
pkgname=yatm
pkgver=0.6
pkgrel=1
pkgdesc="A simple command line audio player which can perform playback at a different speed than the original audio was recorded with."
arch=('i686' 'x86_64')
url="http://delysid.org/yatm.html"
license=('GPL')
depends=('soundtouch')
source=(http://delysid.org/${pkgname}-${pkgver}.tar.gz)
md5sums=('a0aca8c36053ba222a04dcd93e32fea8')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
