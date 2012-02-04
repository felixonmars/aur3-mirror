# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python-pyv8
_pkgname=PyV8
pkgver=0.9
pkgrel=2
pkgdesc="a python wrapper for Google V8 javascript engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyv8/"
license=(APACHE)
depends=('python')
makedepends=('v8-static=2.1.2.3' 'boost')
provides=()
conflicts=('python-pyv8-svn')
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pyv8.googlecode.com/files/$_pkgname-$pkgver.tar.gz)
md5sums=('2d93c13bb2917d628a9974e28d28a25c')

build() {
  cd $srcdir/$_pkgname-$pkgver
  export V8_HOME=/usr/lib/v8
  python setup.py install --root=$pkgdir/ || return 1
}


