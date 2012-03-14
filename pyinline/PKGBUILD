pkgname=pyinline
pkgver=0.03
pkgrel=1
pkgdesc="Embed C code in Python code inline"
arch=('any')
url="http://pyinline.sourceforge.net/"
license=('artistic')
depends=('python2')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/PyInline-$pkgver.tar.gz")
md5sums=('c620f013f960f0c09481b6529c62bc1a')

build() {
    cd "$srcdir/PyInline-$pkgver"
    python2 setup.py build install --root="$pkgdir" || return 1
}
