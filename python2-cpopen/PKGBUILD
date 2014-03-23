# Maintainer: Antoni Segura Puimedon <antonisp@celebdor.com>
pkgname=python2-cpopen
_srcdirname=cpopen
pkgver=1.3
pkgrel=1
pkgdesc="A C reimplementation of Python's Popen."
arch=('i686' 'x86_64')
url="https://github.com/ficoos/cpopen"
license=('GPL')
groups=()
depends=('python2')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/c/cpopen/cpopen-1.3.tar.gz")
md5sums=("7714dabab385a02ffeee37cd12311c29")

build() {
  cd "$srcdir/$_srcdirname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_srcdirname-$pkgver"
  python2 setup.py install --root="$pkgdir/"
}
