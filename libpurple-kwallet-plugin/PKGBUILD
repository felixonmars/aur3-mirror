# Maintainer: Alessio Sergi <asergi [at] archlinux [dot] us>

pkgname=libpurple-kwallet-plugin
_realname=libpurple_kwallet_plugin
pkgver=0.1
pkgrel=2
pkgdesc="KWallet plugin for libpurple based client"
arch=('any')
url="http://kde-apps.org/content/show.php/Libpurple+KWallet+Plugin?content=127658"
license=('GPL3')
depends=('libpurple' 'perl-net-dbus')
source=(http://gitorious.org/${pkgname}/${pkgname}/blobs/raw/master/${_realname}.pl)
md5sums=('b8defa39aebc98bd050e13cb27b8363a')

package() {
  install -d -m755 ${pkgdir}/usr/lib/purple-2
  install -m644 ${srcdir}/${_realname}.pl ${pkgdir}/usr/lib/purple-2/
}

