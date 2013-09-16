# Maintainer: jaseg <arch@jaseg.net>

pkgname=pixelterm-git
pkgver=0.52.6a1f990
pkgrel=1
pkgdesc="Display images on a terminal. Even works with animated GIFs"
arch=('any')
license=('GPL')
url="https://github.com/jaseg/pixelterm"
depends=('python' 'python-pillow')
makedepends=('git')
provides=('pixelterm')
source=('git+https://github.com/jaseg/pixelterm#branch=master')
md5sums=('SKIP')

_gitname="pixelterm"

pkgver() {
  cd "$srcdir/$_gitname"
  microver="$(git log -1 --pretty=format:%h )"
  minorver="$(git rev-list --count HEAD)"
  echo "0.$minorver.$microver"
}

build() {
	true
}

package() {
  cd "${srcdir}/$_gitname"
  python setup.py install --root="$pkgdir"
}
