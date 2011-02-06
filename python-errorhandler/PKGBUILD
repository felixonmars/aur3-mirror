# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python-errorhandler
_realname=errorhandler
pkgver=1.1.0
pkgrel=1
pkgdesc="A logging framework handler that tracks when messages above a certain level have been logged."
arch=(any)
url="http://www.simplistix.co.uk/software/python/errorhandler"
license=(MIT)
depends=('python')
source=(http://pypi.python.org/packages/source/e/errorhandler/$_realname-$pkgver.tar.gz)
#makedepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=(!emptydirs)
#install=
md5sums=('96db35e03366231ee478bf804e9c5e1e')

build() {
  cd $srcdir/$_realname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}


