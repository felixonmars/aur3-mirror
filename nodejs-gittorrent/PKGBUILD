_npmname=gittorrent
_npmver=0.1.7
pkgname=nodejs-gittorrent # All lowercase
pkgver=0.1.7
pkgrel=1
pkgdesc="Using BitTorrent to share git repositories"
arch=(any)
url="http://gittorrent.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
makedepends=('python2-virtualenv')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(c7bfab68e1e1b2b2a0aaf4ee7f966fca3d26af68)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  virtualenv2 --python=python2 venv
  . ./venv/bin/activate
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
