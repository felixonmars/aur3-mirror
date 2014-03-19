pkgname=python-udt4py
pkgver=1.1
pkgrel=1
pkgdesc="libudt4 Python wrapper written with Cython"
url="https://github.com/vmarkovtsev/udt4py"
depends=('python3' 'udt')
makedepends=('python3')
license=('CUSTOM')
arch=('any')
source=("https://github.com/vmarkovtsev/udt4py/archive/pypi-${pkgver}.tar.gz")
md5sums=('4acdf6c053b7629bd6c3f2192e0c40ef')

build() {
    cd $srcdir/udt4py-pypi-${pkgver}
    python3 setup.py build
}

package() {
    cd $srcdir/udt4py-pypi-${pkgver}
    python3 setup.py install --root="$pkgdir" --optimize=1 

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
