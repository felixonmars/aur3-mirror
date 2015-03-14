# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=brutez
pkgver=0.12
pkgrel=2
pkgdesc="Shell script that determines the best compression format for size"
arch=('any')
url="http://sourceforge.net/projects/brutez"
license=('GPL')
depends=('sh')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('7cb21bd63d94527fd13b62a343ea3755')


package() {
  install -Dm755 brutez $pkgdir/usr/bin/brutez
}

# vim:set ts=2 sw=2 et:
