# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=python2-futures
pkgver=2.1.6
pkgrel=1
pkgdesc="Backport of the concurrent.futures package from Python 3.2"
arch=('any')
url="http://code.google.com/p/pythonfutures/"
license=('BSD')
depends=('python2')
source=("http://pypi.python.org/packages/source/f/futures/futures-$pkgver.tar.gz")
md5sums=('cfab9ac3cd55d6c7ddd0546a9f22f453')

package() {
    cd ${srcdir}/futures-$pkgver
    python2 setup.py install --root ${pkgdir} --optimize=1
}
