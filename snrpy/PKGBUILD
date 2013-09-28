# Maintainer: Michal Borejszo <spitfire05pl@gmail.com>
pkgname="snrpy"
pkgver="1.0.0"
pkgrel=2
pkgdesc="Search & Replace CLI written in python."
arch=(any)
url="https://github.com/spitfire05/snrpy"
license=('MIT')
depends=('python2>=2.3')
makedepends=('sed')
source=($pkgname-$pkgver.tar.gz::https://github.com/spitfire05/snrpy/archive/$pkgver.tar.gz)
md5sums=('fa559d4778a413efd78862279d5b1cfd')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # force use of python2 interpreter
    sed -i '1i #!/usr/bin/env python2' snrpy.py
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 snrpy.py $pkgdir/usr/bin/snrpy
    install -Dm644 LICENSE $pkgdir/usr/share/license/$pkgname/LICENSE
}
