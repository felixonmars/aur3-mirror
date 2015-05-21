_npmname='i3-finder'
pkgname=nodejs-$_npmname
pkgver=0.1.3
pkgrel=3
pkgdesc='I3 wm finder, which allows you to move and focus, and switch back to locations with dmenu'
arch=('any')
url='http://thrownforaloop.com/posts/i3-finder/'
license=('MIT')
depends=('nodejs' 'i3-wm')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('876e245ba602cac3f47638dc267313da')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

