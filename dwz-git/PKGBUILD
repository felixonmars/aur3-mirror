_pkgname=dwz
pkgname=dwz-git
pkgver=0.11.126.1a0614a
pkgrel=1
pkgdesc='DWARF optimization and duplicate removal tool'
arch=('i686' 'x86_64')
license=('GPL2' 'GPL3')
url="http://www.sourceware.org/git/gitweb.cgi?p=dwz.git;a=summary"
depends=('elfutils')
source=("git://sourceware.org/git/dwz.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo "$(git describe | cut -f2- -d -).$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
  cd "$_pkgname"
  make CFLAGS="${CFLAGS}" V=1
}

check() {
  cd "$_pkgname"
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" prefix=/usr install
}
