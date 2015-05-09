# Maintainer: Eduard Bopp <eduard dot bopp at aepsil0n dot de>

_npmname=elm
_npmver=1.3.0
pkgname=nodejs-elm # All lowercase
pkgver=1.3.0
pkgrel=1
pkgdesc="elm-platform wrapper that makes it seamlessly available as a local dependency"
arch=(any)
url="https://github.com/kevva/elm-platform-bin"
license=()
depends=('nodejs' 'libtinfo')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(8fed6e38e2ef13713c41add9bb7771e3f60938fc)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
