# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=g2p
pkgver=0.05
pkgrel=1
pkgdesc="Python application that uses Google to find the music you want"
arch=('any')
url="http://launchpad.net/g2p"
license=('GPL3')
depends=('python')
makedepends=()
source=("http://launchpad.net/g2p/user/0.05/+download/$pkgname-$pkgver.tar.gz" "$pkgname")
md5sums=('1e43b313a622f91032c4f9cf0fb8edf8'
         '822b8e50e4e3b891a1e1bf343d3bddfd')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  /bin/true

}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d $pkgdir/usr/share/$pkgname/data

  install -Dm644 g2p.{png,py} $pkgdir/usr/share/$pkgname/

  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname

  install -Dm644 data/{websites.txt,config.{pyc,py}} $pkgdir/usr/share/$pkgname/data/
}

# vim:set ts=2 sw=2 et:
