# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=python-pykka
pkgver=1.2.0
pkgrel=1
pkgdesc="Easy to use concurrency abstractions for Python using the actor model. Native impl. only."
arch=('any')
url="http://pykka.readthedocs.org/"
license=('Apache')
depends=('python')
provides=('python-pykka')
source=("http://pypi.python.org/packages/source/P/Pykka/Pykka-${pkgver}.tar.gz")
md5sums=('27cb69507f89e34dc1ff34636c4bc165')

package() {
    cd ${srcdir}/Pykka-${pkgver}
    python setup.py install --prefix=/usr --root=${pkgdir}/ --optimize=1

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
