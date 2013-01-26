# Maintainer: TDY <tdy@archlinux.info>

pkgname=dispus
pkgver=2.7
pkgrel=1
pkgdesc="DIsk SPace USage tool"
arch=('any')
url="http://www.debianhelp.co.uk/dispus.htm"
license=('unknown')
depends=('perl')
source=(http://anni.galaxy4.net/files/$pkgname${pkgver/.}.zip)
sha256sums=('7863d3d0de26aea7a634afb7738a488161843895ab08b7f3e9ad4f83d2b79c81')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
