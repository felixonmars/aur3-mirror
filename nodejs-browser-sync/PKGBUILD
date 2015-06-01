_npmname=browser-sync
_npmver=2.7.6
pkgname=nodejs-browser-sync # All lowercase
pkgver=2.7.6
pkgrel=1
pkgdesc="Live CSS Reload & Browser Syncing"
arch=(any)
url="http://www.browsersync.io/"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(d82cd3c5f52e98970ac88cbc6678a3f767c5bf1b)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et: