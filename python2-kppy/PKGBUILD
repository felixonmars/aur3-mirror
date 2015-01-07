# Maintainer: lykaner <lykaner@posteo.net>
# Contributor: lykaner <lykaner@posteo.net>
pkgname=python2-kppy
pkgver=1.4.2
pkgrel=1
pkgdesc="A Python-module to provide an API to KeePass 1.x files which are also used by the popular KeePassX."
arch=(any)
url="https://raymontag.github.com/kppy"
license=('GPL')
depends=('python2-crypto' 'python2') 
source=(https://pypi.python.org/packages/source/k/kppy/kppy-$pkgver.tar.gz)
provides=('kppy')
md5sums=('c8c4351877ff3489f95985c8f7a968a8')

build() {
    cd $srcdir/kppy-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/kppy-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

