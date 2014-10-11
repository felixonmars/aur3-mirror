# Submitter: renodesper <reno.esper@gmail.com>
# Maintainer: renodesper <reno.esper@gmail.com>
_npmname=learnyounode
_npmver=1.0.3
pkgname=$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Learn You The Node.js For Much Win! An intro to Node.js via a set of self-guided workshops."
arch=(any)
url="https://github.com/rvagg/learnyounode"
license=('MIT')
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
md5sums=('e9b85fd82b450bbdcd037aa19d423e3a')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
