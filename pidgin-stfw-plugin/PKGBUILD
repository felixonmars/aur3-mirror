# Maintainer: Pavel <otchertsov@gmail.com>

pkgname=pidgin-stfw-plugin
pkgver=1.1.0
pkgrel=1
pkgdesc="Pidgin plugin that helps you teach your buddies how to use google"
arch=('i686 x86_64')
url="http://linuxandwhatever.wordpress.com/stfw-pidgin-plugin/"
license=('GPL')
depends=('pidgin' 'glib2')
source=('http://www.cs.hs-rm.de/~ksteb001/stfw/stfw.tar.gz')
md5sums=('c94d94db1e4033a107ea4c602c24812b')

build() {
  cd ${srcdir}/stfw
  ./build
  mkdir -p ${pkgdir}/usr/lib/pidgin
  cp stfw.so ${pkgdir}/usr/lib/pidgin
}
