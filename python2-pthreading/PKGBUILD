# Maintainer: Antoni Segura Puimedon <antonisp@celebdor.com>
pkgname=python2-pthreading
pkgver=0.1.3
pkgrel=1
pkgdesc="Python bindings for the ethtool kernel interface."
arch=('i686' 'x86_64')
url="https://git.fedorahosted.org/cgit/pthreading.git/"
license=('GPL')
groups=()
depends=('python2')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$pkgname::git+https://git.fedorahosted.org/git/pthreading.git#commit=cefae776")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/"
}
