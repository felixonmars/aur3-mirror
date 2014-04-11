# Maintainer: Phil Pirozhkov <pirjsuka+chgems@gmail.com>
_gitname=chgems
_pkgname=$_gitname
pkgname=$_pkgname-git
_pkgver=0.3.3
pkgver=0.3.2.14.g568c878
pkgrel=1
pkgdesc="chroot for RubyGems"
arch=('any')
url="https://github.com/postmodern/$_gitname"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "$_gitname"
  local version="$(git describe --always)"
  local version="${version#v}"
  echo "${version//-/.}"
}

package() {
  _make_install
  _normalize_dir_name
  _symlink_license_to_std_location
}

_make_install() {
  cd "$srcdir/$_gitname"
  make "PREFIX=$pkgdir/usr" install
}

_normalize_dir_name() {
  cd "$pkgdir/usr/share/doc"
  mv "$_pkgname-$_pkgver" "$_pkgname"
}

_symlink_license_to_std_location() {
  local license_dir=usr/share/licenses/$_pkgname

  mkdir -p "$pkgdir/$license_dir"
  cd "$pkgdir/$license_dir"
  ln -s "../../doc/$_pkgname/LICENSE.txt" LICENSE
}

# vim:set ts=2 sw=2 et:
