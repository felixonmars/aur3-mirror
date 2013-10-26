# Contributor: Sebastian Wiesner <lunaryorn googlemail com>
# Maintainer: Igor Ramos Tiburcio <irtigor@yahoo.com.br>
# Current Maintainer: Wieland Hoffmann <themineo+aur@gmail.com>
pkgname=python2-py
pkgver=1.4.17
pkgrel=1
pkgdesc="Python rapid development tools"
arch=('any')
url="http://pylib.org"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/p/py/py-$pkgver.tar.gz")

package() {
    cd "$srcdir/py-$pkgver"
    python2 setup.py install --root="$pkgdir" -O1
}
md5sums=('1dba4de9f1ac9b3e025895a0b6ad5a91')
