# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=bigpkg
pkgver=0.4.0
pkgrel=2
pkgdesc="Script to find packages that require a lot of space on your system, by Allan."
arch=(any)
url="https://bbs.archlinux.org/viewtopic.php?id=73098&p=1"
license=('GPL')
depends=('python' 'pacman')
install=
source=(http://allanmcrae.com/scripts/$pkgname)
sha256sums=('39becd1a438cbc87e968365ed16b00a28de2e337abdb264a4e2650cf9aa7c393')


package() {
  install -D -m755 $pkgname $pkgdir/usr/bin/bigpkg
}

