#Maintainer: Mitchell Ferguson <mitchell@ferguson.geek.nz>
_npmname=meteorite
_npmver=0.9.0
pkgname=nodejs-meteorite # All lowercase
pkgver=0.9.0
pkgrel=1
pkgdesc="Installer & smart package manager for Meteor"
arch=(any)
url="http://oortcloud.github.com/meteorite"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
#noextract=($_npmname-$_npmver.tgz)
license=('custom')
sha1sums=('354160ede2d05edf9b4610a3bc91547068444371')

package() {
  cd $srcdir
  install -Dm644 package/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
