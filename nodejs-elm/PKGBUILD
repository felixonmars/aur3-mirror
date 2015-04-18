_npmname=elm
_npmver=1.2.0
pkgname=nodejs-elm # All lowercase
pkgver=1.2.0
pkgrel=1
pkgdesc="elm-platform wrapper that makes it seamlessly available as a local dependency"
arch=(any)
url="https://github.com/kevva/elm-platform-bin"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(99f3c7001e4eda85707c39acb3500d6a680d0e2b)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
