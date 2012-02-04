# Maintainer: Dan Serban

pkgname=xcursor-wonderland
pkgver=latest
pkgrel=1
pkgdesc="Mouse cursor theme"
arch=(any)
url=http://127.0.0.1/
license=(unknown)
depends=(libxcursor)
source=(http://ompldr.org/vOHJzaQ/wonderland.tar.gz)
md5sums=('b487ce6adb9fad8bd983b57cd1e62a7e')

build()
{
  mkdir -p "${pkgdir}"/usr/share/icons
  mv wonderland "${pkgdir}"/usr/share/icons/
}
