# Maintainer: Alexander Dsucheleit <jinks@archlinux.us>

pkgname=python-managesieve
pkgver=0.5
pkgrel=1
pkgdesc="A Python module implementing the ManageSieve client protocol. "
arch=(any)
url="http://pypi.python.org/pypi/managesieve"
license=('Python')
depends=(python2 python2-ez-setup)
source=(https://pypi.python.org/packages/source/m/managesieve/managesieve-0.5.tar.bz2)

package() {
  cd "$srcdir/managesieve-$pkgver"
  python2 setup.py install --root=$pkgdir || return 1
}
md5sums=('f40aaee52b08fcbbc7617e2344fa37d2')
