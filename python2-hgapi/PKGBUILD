# Submitter: Stefan Tatschner <stefan.tatschner at gmail dot com>
# Maintainer: Yeison Cardona <yeison.eng@gmail.com>

pkgname=python2-hgapi
_pkgname=hgapi
pkgver=1.7.1
pkgrel=1
pkgdesc="hgapi is a pure-Python API to Mercurial, that uses the command-line interface instead of the internal Mercurial API."
arch=('any')
url="https://bitbucket.org/haard/hgapi/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute' 'mercurial')
source=("${_pkgname}-${pkgver}::https://pypi.python.org/packages/source/h/hgapi/${_pkgname}-${pkgver}.tar.gz")
md5sums=('bddaf5bb08116790f4f16aa05934fd43')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python2 setup.py install --root=$pkgdir
}

