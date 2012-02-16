# Maintainer: Diego Mascialino <diego@gcoop.coop>

pkgname=pilas-hg
pkgver=20120216
pkgrel=1
pkgdesc="Un motor para hacer videojuegos de manera sencilla en Python. An engine to make games in an easy way with Python."
arch=('any')
depends=('python2' 'setuptools' 'pybox2d_20-svn' 'python2-pyqt')
makedepends=('mercurial')
license=('LGPL')
url="http://www.pilas-engine.com.ar"

build() {
    cd ${srcdir}
    if [ -d pilas/.hg ]; then
        (cd pilas && hg pull -u)
    else
        hg clone https://bitbucket.org/hugoruscitti/pilas
    fi

    cd pilas
    python2 setup.py build
    python2 setup.py install --root=$startdir/pkg
}

md5sums=()

