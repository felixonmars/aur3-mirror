# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=pySVG
pkgname=python2-pysvg
pkgver=0.2.1
pkgrel=1
pkgdesc="A pure Python library to create/load and manipulate SVG documents."
arch=(i686 x86_64)
url="http://codeboje.de/pysvg/"
license=('GPL')
depends=('python2')
provides=('pysvg')
conflicts=("$pkgname-svn")
source=("http://pysvg.googlecode.com/files/$_pkg.zip")
md5sums=('c0391a3a281daceaddbd3cc2f52c34d3')

build() {
  cd "$srcdir/$_pkg"

  # python2 fix
  sed -i "s|\(bin/python\).*|\12|" `grep -rl "bin/python" .`

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkg"

  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
