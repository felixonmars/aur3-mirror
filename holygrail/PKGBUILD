# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=HolyGrail
pkgname=holygrail
pkgver=0.2
pkgrel=2
pkgdesc="A python GTD base library to interact with a todo (missions) database."
arch=(any)
url="http://blog.worlddomination.be/holygrail"
license=('AGPL3')
depends=('python2-sqlobject')
install="$pkgname.install"
source=("http://pypi.python.org/packages/source/H/$_name/$_name-$pkgver.Perceval.tar.gz")
md5sums=('7589e654e68575012ecfc08543c9f043')

build() {
  cd "$srcdir/$_name-$pkgver.Perceval"

  # add missing README.rst
  touch README.rst

  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver.Perceval"

  python2 setup.py install --root="$pkgdir/"

  # python2 fixes
  sed -i "s|bin/python|&2|" \
    `grep -rl "bin/python" "$pkgdir"`
}

# vim:set ts=2 sw=2 et:
