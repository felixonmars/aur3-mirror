# Maintainer: Junchun Guan <junchunx.guan@gmail.com>
pkgname=gbs
pkgver=0.23.1
pkgrel=1
pkgdesc="Git build system for Tizen"
arch=(any)
url="https://download.tizen.org/tools/latest-release"
license=('GPL2')
depends=('python2'
         'python2-pycurl'
         'git'
         'sudo'
         'pristine-tar'
         'depanneur'
         'mic'
         'librpm-tizen'
         'gbp-tizen')
makedepends=('python2-docutils')
optdepends=('osc: Command line client for openSUSE Build Service')
source=(git+git://git.tizen.org/tools/gbs)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git describe --always | sed -r 's/-/./g')
}

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
  make man
}

package() {
  cd "$srcdir"
  cd "$srcdir/$pkgname"

  python2 setup.py install --root="$pkgdir"
  install -D docs/gbs.1 "$pkgdir/usr/share/man/man1/gbs.1"
}

