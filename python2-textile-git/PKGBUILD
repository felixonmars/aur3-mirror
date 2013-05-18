# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname=python2-textile-git
pkgver=2.1.3.171.g00e2235
pkgrel=1
pkgdesc="A Python port of Textile, A humane web text generator"
arch=('any')
url="https://github.com/sebix/python-textile"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute' 'git')
provides=('python2-textile')
conflicts=('python2-textile')
source=("git://github.com/sebix/python-textile.git")
md5sums=('SKIP')

_gitname="python-textile"

pkgver() {
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g' | sed 's|v||g'
}

build() {

  cd "$srcdir"/$_gitname

  python2 setup.py build

}

package() {

  cd "$srcdir/$_gitname"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 $srcdir/$_gitname/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

}

# vim:set ts=2 sw=2 et:
