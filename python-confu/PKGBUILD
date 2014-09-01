# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
_python=python
_distname=confu
pkgname=$_python-$_distname
pkgver=0.0.2
pkgrel=2
pkgdesc='Configuration management without the "FFUUU~".'
arch=(any)
url="http://github.com/neithere/confu"
license=('LGPL3')
depends=(
  'python-monk>=0.13.1'
)
optdepends=()
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/${_distname:0:1}/$_distname/$_distname-$pkgver.tar.gz")
md5sums=('09ec25fa4ebbbc5bc8a9bf38bd8c6ab5')

package() {
  cd "$srcdir/$_distname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
