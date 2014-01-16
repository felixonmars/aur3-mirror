# Maintainer: mitsuse <mitsuset - gmail>
pkgname=python2-frozen-flask
pkgver=0.11
pkgrel=1
pkgdesc="Freezes a Flask application into a set of static files. The result can be hosted without any server-side software other than a traditional web server."
arch=('any')
url="http://pypi.python.org/pypi/Frozen-Flask"
license=('BSD')
depends=('python2-flask>=0.7')
makedepends=('python2-distribute')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://pypi.python.org/packages/source/F/Frozen-Flask/Frozen-Flask-$pkgver.tar.gz")
md5sums=('bb1f2cf7d752868a0196070d9cd65b21')

package() {
    cd $srcdir/Frozen-Flask-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}

