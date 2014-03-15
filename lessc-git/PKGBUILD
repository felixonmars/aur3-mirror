# Maintainer: Mauricio Calligaris <mcalligaris@slack.us>
# Maintainer: Jacob Courtneay <jacob@sporkexec.com>
pkgname=lessc-git
pkgver=v1.7.0.10.g372c554
pkgrel=1
pkgdesc="A standalone compiler for the Less css language."
arch=('any')
url="http://lesscss.org/"
license=('Apache')
depends=('nodejs')
makedepends=('git')
provides=('lessc')
source=("$pkgname"::'git://github.com/less/less.js.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --always | sed 's|-|.|g'
}

package() {
  install -d "$pkgdir/usr/lib/node"
  install -d "$pkgdir/usr/bin"
  cp -r "$srcdir/$pkgname/lib/less" "$pkgdir/usr/lib/node/less"
  ln -s "node/less" "$pkgdir/usr/lib/less"
  cp "$srcdir/$pkgname/bin/lessc" "$pkgdir/usr/bin/lessc"
}
