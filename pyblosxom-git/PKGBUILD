pkgname=pyblosxom-git
pkgver=20120819
pkgrel=1
pkgdesc="Lightweight file-based weblog system"
arch=('i686' 'x86_64')
url="http://pyblosxom.github.com/"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('pyblosxom')
conflicts=('pyblosxom')
source=()
md5sums=()

_gitroot="https://github.com/pyblosxom/pyblosxom"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  python2 setup.py install --root=$pkgdir || return 1
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/pyblosxom/LICENSE.txt
}
