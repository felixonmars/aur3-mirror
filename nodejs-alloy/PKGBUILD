# Maintainer: tonylukasavage &lt;anthony.lukasavage@gmail.com&gt;
# Maintainer: cb1kenobi &lt;chris@cb1inc.com&gt;
# Maintainer: ingo &lt;ingo@muschenetz.com&gt;
# Maintainer: mxia &lt;mxia@appcelerator.com&gt;
_npmname=alloy
pkgname=nodejs-alloy
pkgver=1.4.0
pkgrel=1
pkgdesc="Appcelerator Titanium MVC Framework"
arch=(any)
url="https://github.com/appcelerator/titanium"
license=(Apache Public License v2)
depends=('nodejs')
optdepends=()

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
