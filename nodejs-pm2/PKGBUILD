_npmname=pm2
pkgname=nodejs-$_npmname
pkgver=0.12.7
pkgrel=1
pkgdesc="Modern CLI process manager for Node apps with a builtin load-balancer"
arch=('any')
url="https://github.com/Unitech/pm2"
license=('MIT')
depends=('nodejs')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('b57bc5bfefb1bd59954e79e679fdf990')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver --unsafe-perm
}

