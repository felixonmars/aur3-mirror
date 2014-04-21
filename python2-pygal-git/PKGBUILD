# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python2-pygal-git
_gitname=pygal
pkgver=latest
pkgrel=1
pkgdesc="A python svg graph plotting library"
arch=('any')
url="http://pygal.org/"
license=('LGPL3')
depends=('python2' 'python2-lxml')
optdepends=(
  'python2-cairosvg: PNG output'
  'python2-tinycss: PNG output'
  'python2-cssselect: PNG output'
  'python2-scipy: Interpolation support'
  'python2-pytest: Unit testing'
)
provides=('python2-pygal')
conflicts=('python2-pygal')
options=(!emptydirs)
source=('git+https://github.com/Kozea/pygal.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  python2 setup.py build
}

package() {
  cd "$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

