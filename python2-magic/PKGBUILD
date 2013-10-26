# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wes Brown <wesbrown18@gmail.com>

pkgname=python2-magic
pkgver=0.4.6
pkgrel=1
pkgdesc="This is the Python interface to the magic library providing file identificaiton services.."
arch=(any)
url=http://pypi.python.org/pypi/python-magic/
license=(PSF)
depends=(python2)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname//2}/${pkgname//2}-$pkgver.tar.gz)
sha256sums=('903d3d3c676e2b1244892954e2bbbe27871a633385a9bfe81f1a81a7032df2fe')
sha512sums=('66c3a7a3120ea360422fe422c373a403a21be674f8df213a80ce83b02051cc1f0d0a2aaa7b4d512194e6914d801062036bdfa5155ead350dde154725808944f6')

build() {
    cd ${pkgname//2}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${pkgname//2}-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1
}
