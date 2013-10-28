# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=pynt
pkgver=0.8.0
pkgrel=1
pkgdesc="Lightweight Python Build Tool."
arch=(any)
url="http://rags.github.io/pynt/"
license=('GPL3')
depends=('python')
provides=('pynt')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a7c1fd5467e60d3a9a942fc0c6e45d8f')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python3 setup.py install --root=${pkgdir}/ --optimize=1
}
