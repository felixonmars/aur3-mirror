#Maintainer: Dominik Kozaczko <aur@kozaczko.info>

pkgname=python-webassets
pipname=webassets
pkgver=0.10.1
pkgrel=1
pkgdesc="Media asset management for Python, with glue code for various web frameworks."
arch=(any)
url="http://github.com/miracle2k/webassets/"
license=('BSD')
depends=('python' 'python-django')
optdepends=('python-pillow: support for image manipulation'
            'python-nose: required to run tests'
            'python-mock: required to run tests'
)
source=("http://pypi.python.org/packages/source/w/${pipname}/${pipname}-${pkgver}.tar.gz")
md5sums=('8007980e0ef38c9a42f577b2b2362e76')

package() {
    cd "$srcdir/$pipname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}

