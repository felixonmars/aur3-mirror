# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

_npmname=irccloud-cli
pkgname=nodejs-$_npmname
pkgver=0.1.8
pkgrel=1
pkgdesc="irccloud commandline interface"
arch=(any)
url="https://github.com/yhsiang/irccloud-cli"
license=('MIT')
depends=('nodejs' 'nodejs-livescript')
makedepends=('nodejs')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('13bbe3901c7435ac2de86500eeaeb74b')

package() {
  cd "$srcdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname-$pkgver.tgz"
}

# vim:set ts=2 sw=2 et:
