# Contributor: p2k <patrick.p2k.schneider@gmail.com>
pkgname=pycow
pkgver=0.2
pkgrel=1
pkgdesc="A Python to JavaScript with MooTools translator"
arch=('i686' 'x86_64')
url="http://github.com/p2k/pygowave"
license=('APACHE')
depends=('python-simplejson')
makedepends=('setuptools')
source=(http://github.com/p2k/PyCow/tarball/$pkgname-$pkgver.tar.gz)
md5sums=('37ed33dc9a9ae8472ea42104008a3a89')

build() {
  cd $srcdir/p2k-PyCow-*

  ./setup.py build || return 1
  ./setup.py install --root=$pkgdir || return 1
}

# vim:set ts=2 sw=2 et:
