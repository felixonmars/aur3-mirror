# Author: Jesus Alvarez <jeezusjr@gmail.com>
pkgname=nodejs-tern-git
pkgver=377.bf434fe
pkgrel=1
pkgdesc="A javascript auto-complete and suggestion tool."
arch=('any')
url="http://ternjs.net/"
license=('MIT')
depends=('nodejs')
makedepends=('git')
source=('git+https://github.com/marijnh/tern')
md5sums=('SKIP')
install=tern.install

pkgver() {
  cd "$srcdir/tern/"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/tern"
}
# vim:set ts=2 sw=2 et:
