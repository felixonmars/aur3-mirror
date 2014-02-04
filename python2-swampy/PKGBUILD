# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=python2-swampy
pkgver=2.1.7
pkgrel=1
pkgdesc="Companion code for Think Python."
arch=('any')
url="http://www.greenteapress.com/thinkpython/swampy/"
license=('GPL')
depends=('python2')
changelog=Changelog
source=("https://pypi.python.org/packages/source/s/swampy/swampy-${pkgver}.tar.gz")
sha256sums=('a7046d007ec1a477669be0c8ca8dd300204e7f5fc6b7e72d7ab3e09d4ddcf6c3')

prepare() {
    cd $srcdir/swampy-$pkgver
    # python2 fix
    for file in swampy/*.py ; do
        sed -i 's#/usr/bin/python#/usr/bin/python2#' $file
    done
}

package() {
    cd $srcdir/swampy-$pkgver
    python2 setup.py install --root=$pkgdir
}

