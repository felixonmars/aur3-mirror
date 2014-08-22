pkgname=bpython-git
pkgver=0.12.r1365.g5dc6c71
pkgrel=1
pkgdesc="A fancy interface for the Python interpreter"
arch=('any')
url="http://www.bpython-interpreter.org/"
license=('MIT')
depends=('python-blessings')
conflicts=('bpython')
provides=('bpython')
source=("$pkgname::git+https://github.com/bpython/bpython/")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/release.//g'
}

build() {
  cd $pkgname

  python setup.py build
}

package() {
  cd $pkgname

  python setup.py install --root="$pkgdir"
}
