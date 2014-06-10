# Maintainer: sharow <shirowmiura@gmail.com>

pkgname=ttyload-git
pkgver=0.5.3.112.f949537
pkgrel=3
pkgdesc="graphical tracking of UNIX load average in a terminal"
arch=('i686' 'x86_64')
url="https://github.com/lindes/ttyload"
license=('custom')
depends=('glibc')
makedepends=('git')
conflict=('ttyload')
source=("$pkgname"::'git+https://github.com/lindes/ttyload.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local version="$(cat Version)"
  local count="$(git rev-list --count --all master)"
  local rev="$(git rev-parse --short master)"
  echo "$version.$count.$rev"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 ttyload "${pkgdir}/usr/bin/ttyload"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/ttyload/LICENSE"
}

