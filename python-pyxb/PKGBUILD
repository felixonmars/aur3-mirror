# Maintainer: Michal Mináø <mr.mini at centrum dot cz>

pkgname=python-pyxb
pkgver=1.0.0
pkgrel=1
pkgdesc="A pure Python package for generating Python source code from XMLSchema."
arch=(any)
url="http://pyxb.sourceforge.net/"
license=('APACHE')
depends=('python')
options=(!emptydirs)
source=("http://downloads.sourceforge.net/sourceforge/pyxb/PyXB-full-${pkgver}.tar.gz")
md5sums=('b920b36905b7f55f1df6cb71930ed35f')

build() {
    cd $srcdir/PyXB-$pkgver/
    python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
