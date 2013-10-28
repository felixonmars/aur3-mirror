# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=python2-flake8
_reponame=flake8
pkgver=2.1.0
pkgrel=1
pkgdesc="the modular source code checker: pep8, pyflakes and co"
arch=('any')
url="http://bitbucket.org/tarek/flake8"
license=('MIT')
makedepends=('python2-distribute')
depends=(
    'python2'
    'python2-pyflakes'
    'pep8-python2'
    'python2-mccabe'
)
provides=('python2-flake8')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/f/${_reponame}/${_reponame}-${pkgver}.tar.gz")
md5sums=('cf326cfb88a1db6c5b29a3a6d9efb257')
install=python2-flake8.install

package() {
    cd ${srcdir}/${_reponame}-${pkgver}
    python2 setup.py install --root=${pkgdir}/ --prefix=/usr --optimize=1

    mv "${pkgdir}/usr/bin/flake8" "${pkgdir}/usr/bin/flake8-python2"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
