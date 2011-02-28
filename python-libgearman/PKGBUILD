# Maintainer: Casper Bruun <casperbruun@gmail.com>

pkgname=python-libgearman
pkgver=0.13.2
pkgrel=1
pkgdesc="Gearman bindings for Python"
arch=(any)
url="https://launchpad.net/gearman-interface"
license=(Simplified BSD License)
depends=(python)
makedepends=(python)
source=(http://launchpad.net/gearman-interface/trunk/libgearmanv0.13/+download/gearman-interface-$pkgver.tar.gz)
md5sums=('5788c02867fbb54eb4959ff590a4a0a4')

build() {
    cd $srcdir/gearman-interface-$pkgver/python3
    # fixes python error where the module release cannot be found
    mv gearman/release.py.in gearman/release.py
    python setup.py install --root=$pkgdir
}


 
