# Maintainer: Tim Hatch <tim@timhatch.com>

pkgname=python-findimports
_name=findimports
pkgver=1.2.10
pkgrel=1
pkgdesc="Python module import analysis tool"
arch=(any)
url="https://launchpad.net/findimports"
license=(GPL)
depends=('python' 'setuptools')
source=(http://pypi.python.org/packages/source/f/$_name/$_name-$pkgver.tar.gz)
conflicts=('python-findimports')
replaces=('python-findimports')
provides=('python-findimports')
md5sums=(f7d5fc0adbd30490eadfd6871305a86e)

build() {
        cd $srcdir/$_name-$pkgver

        python setup.py install --root=$pkgdir || return 1
}

