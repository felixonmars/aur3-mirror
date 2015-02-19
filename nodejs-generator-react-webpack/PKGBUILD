_npmname=generator-react-webpack
_npmver=1.1.12
pkgname=nodejs-generator-react-webpack # All lowercase
pkgver=1.1.12
pkgrel=1
pkgdesc="Yeoman generator for ReactJS and Webpack"
arch=(any)
url="https://github.com/newtriks/generator-react-webpack"
license=(MIT)
depends=('nodejs' 'nodejs-yeoman')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(9e72f8a036bfed7ab6ed29882805b1508d2ba321)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/yo
}

# vim:set ts=2 sw=2 et:
