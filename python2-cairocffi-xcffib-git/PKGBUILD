# Maintainer: Marti Raudsepp <marti@juffo.org>
pkgname="python2-cairocffi-xcffib-git"
pkgver=160.132098d
pkgrel=2
pkgdesc="CFFI-based drop-in replacement for Pycairo - xcffib patched"
license=('BSD')
arch=('any')
url="https://github.com/flacjacket/cairocffi/tree/xcb"
depends=('python2' 'python2-cffi' 'cairo')
makedepends=('python2-setuptools')
provides=('python2-cairocffi')
conflicts=('python2-cairocffi')
source=("git://github.com/flacjacket/cairocffi.git#branch=xcb")
_gitname=cairocffi
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_gitname
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
