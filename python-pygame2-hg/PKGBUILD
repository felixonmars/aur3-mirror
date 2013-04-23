pkgname=python-pygame2-hg
pkgver=159
pkgrel=1
pkgdesc="Pygame Reloaded, a Python game library"
arch=(any)
url="http://code.google.com/p/pgreloaded"
license=(LGPL)
depends=(python sdl-hg openal)
makedepends=(mercurial python-sphinx)
source=(pgreloaded::hg+https://pgreloaded.googlecode.com/hg)
md5sums=(SKIP)

pkgver() {
  cd pgreloaded
  hg identify -n
}

prepare() {
  cd pgreloaded
  sed '/*.dll/d' -i setup.py
}

build() {
  cd pgreloaded
  python setup.py build

  #cd doc
  #sed -e '/install.rst/d' -e '/ref/d' -e '/todolist/d' -i index.rst
  #make man
}

package() {
  cd pgreloaded
  python setup.py install --root="$pkgdir" --optimize=1

  #install -Dm644 doc/_build/man/pygame2.1 \
#	"$pkgdir/usr/share/man/man1/pygame2.1"
}

