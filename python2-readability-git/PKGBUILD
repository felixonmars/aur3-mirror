# Maintainer: Germain Z. <germanosz@gmail.com>

_gitname=python-readability
pkgname=python2-readability-git
pkgver=0.3.0.3.8_gaeb4f4c
pkgrel=1
pkgdesc="Fast Python port of arc90's readability tool."
arch=('any')
url="https://github.com/buriy/python-readability"
license=('Apache')
depends=('python2' 'python2-setuptools')
makedepends=('git')
source=("git://github.com/buriy/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/-/./;s/-/_/g'
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

