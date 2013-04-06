# Maintainer: Brendan Hide <brendan at swiftspirit dot co dot za>
# Contributor: Brendan Hide <brendan at swiftspirit dot co dot za>
pkgname=pacman-update-check
pkgver=0.2
pkgrel=2
pkgdesc="Basic Update checker to complement pacman. Functionality partially obsoleted by checkupdate, introduced with pacman 4.1, the sole exception being AUR support, provided via package-query."
arch=("any")
url="http://swiftspirit.co.za/scripts/"
license=('GPL')
depends=('package-query' 'pacman')

source=("pacman-update-check")
md5sums=('e2116a8d3b2b27e3b74eee54b189c42e')

package() {

  cd $pkgdir
  mkdir -p $pkgdir/usr/bin
  cp -dpr --no-preserve=ownership "../../pacman-update-check" "$pkgdir/usr/bin/"

}
#vim: set ft=PKGBUILD sw=2 ts=2 et
