# Maintainer: Sébastien Martinez <garrik at garrik dot info>

pkgname=paw
pkgver=20110831
pkgrel=1
pkgdesc='Python script to get, check and manage AUR packages'
arch=('any')
url="http://www.garrik.info/datas/code/$pkgname"
license=('MIT')
depends=('python')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('210fa92476590de3bc8e1a922adf5f1c')

build() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm0755 $pkgname.py $pkgdir/usr/bin/$pkgname
    install -Dm0644 COPYING.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
