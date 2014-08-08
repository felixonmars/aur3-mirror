# Maintainer: Skydrome <skydrome@i2pmail.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=urlwatch
pkgver=1.17
pkgrel=1
pkgdesc="A tool for monitoring webpages for updates"
arch=('any')
url="http://thp.io/2008/urlwatch"
license=('BSD')
depends=('python2' 'python2-futures')
source=("http://thp.io/2008/urlwatch/$pkgname-$pkgver.tar.gz")
md5sums=('fb15ca7d3723e3a385ee149d9b19c262')

#prepare() {
#    cd "$srcdir/$pkgname-$pkgver"
#}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
