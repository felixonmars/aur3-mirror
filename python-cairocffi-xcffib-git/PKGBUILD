# Maintainer: Marti Raudsepp <marti@juffo.org>
pkgname="python-cairocffi-xcffib-git"
pkgver=160.132098d
pkgrel=2
pkgdesc="Python3 CFFI-based drop-in replacement for Pycairo - xcffib patched"
license=('BSD')
arch=('any')
url="https://github.com/flacjacket/cairocffi/tree/xcb"
depends=('python' 'python-cffi' 'cairo')
makedepends=('python-setuptools')
provides=('python-cairocffi')
conflicts=('python-cairocffi')
source=("git://github.com/flacjacket/cairocffi.git#branch=xcb")
_gitname=cairocffi
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_gitname
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
