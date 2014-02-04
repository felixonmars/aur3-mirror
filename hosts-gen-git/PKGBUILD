pkgname=hosts-gen-git
_pkgname="${pkgname%-git}"
pkgver=r2.6bb9c77
pkgrel=1
pkgdesc='simple framework to create hosts file from hosts.d'
arch=('any')
url='http://git.r-36.net/hosts-gen'
license=('GPL3')
makedepends=('git')
source=('git://git.r-36.net/hosts-gen')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  patch -p1 -i "$startdir/hosts-gen_etc-prefix.patch"
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  cp examples/gethostszero "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
