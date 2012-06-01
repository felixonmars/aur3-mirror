# Maintainer: Bruno Carlin <self at aerdhyl dot eu>
pkgname=python2-jarn.mkrelease
pkgver=3.5
pkgrel=1
pkgdesc="Build and distribute Python eggs in one simple step"
arch=(any)
url="http://www.jarn.com/"
license=('BSD')
depends=('python2' 'setuptools' 'python2-setuptools_git' 'python2-setuptools_hg')
makedepends=('unzip')
source=(http://pypi.python.org/packages/source/j/jarn.mkrelease/jarn.mkrelease-$pkgver.zip LICENSE)

md5sums=('e48165dd38d88ca3833ec0814ea22f6d'
         '363d5a2d088c23ed4188260fc5283817')
options=(!emptydirs)

build() {
  cd $srcdir/jarn.mkrelease-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -d $pkgdir/usr/share/licenses/$pkgname || return 1
  install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/ || return 1
}
