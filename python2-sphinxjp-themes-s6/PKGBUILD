# Maintainer: mitsuse <mitsuset - gmail>
pkgname=python2-sphinxjp-themes-s6
pkgver=0.1.3
pkgrel=1
pkgdesc="A sphinx theme for generate S6 presentation."
arch=('any')
url="http://pypi.python.org/pypi/sphinxjp.themes.s6"
license=('MIT')
depends=('python2-sphinx')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/s/sphinxjp.themes.s6/sphinxjp.themes.s6-${pkgver}.tar.gz")
md5sums=('0ac2c0c1e4b1c9bb380a5826677f9ebc')

build() {
    cd $srcdir/sphinxjp.themes.s6-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}

