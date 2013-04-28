_npmname=node-easel
pkgname=nodejs-$_npmname
pkgver=0.1.0
pkgrel=1
pkgdesc="node wrapper for EaselJS, utilizing node-canvas."
arch=(i686 x86_64)
url="https://npmjs.org/package/node-easel"
license=("custom")
depends=(nodejs)
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
md5sums=('c63d1bc0c0dedc4828541ef7d3cb8566')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
