#Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname=mypy-git
pkgver=2456
epoch=1
pkgrel=1
pkgdesc="Static type checking for python 3"
arch=('i686' 'x86_64')
url="https://github.com/JukkaL/mypy"
license=('MIT' 'PSF2')
provides=('mypy')
depends=('python>=3.2') 
source=("git+https://github.com/JukkaL/mypy.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mypy"
  git rev-list --count HEAD
}

package() {
  cd "$srcdir/mypy"
  python3 setup.py install --root=$pkgdir --optimize=1
}

