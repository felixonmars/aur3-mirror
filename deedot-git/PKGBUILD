# Maintainer: Patrice Peterson <runiq at archlinux dot us>
_pkgname='deedot'
pkgname="$_pkgname-git"
pkgver=r24.6ed0ce5
pkgrel=1
pkgdesc='A tool for installing dotfile symlinks in your home directory'
arch=('any')
url="https://github.com/DeeNewcum/deedot"
license=('MIT')
depends=('perl')
makedepends=('git')
provides=('deedot')
conflicts=('deedot')
source=("$_pkgname::git+https://github.com/DeeNewcum/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 deedot "$pkgdir/usr/bin/deedot"
}

# vim:set ts=2 sw=2 et:
