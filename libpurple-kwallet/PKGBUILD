# Maintainer: Zom <zom[at]eevul[dot]org>
# Contributor: Alessio Sergi <asergi [at] archlinux [dot] us>

pkgname=libpurple-kwallet
pkgver=0.3.1
pkgrel=1
pkgdesc="KWallet plugin for libpurple based clients"
arch=('any')
url="http://kde-apps.org/content/show.php/Libpurple+KWallet+Plugin?content=127658"
license=('GPL3')
depends=('libpurple' 'perl-net-dbus')
source=(http://gitorious.org/libpurple-kwallet-plugin/libpurple-kwallet-plugin/blobs/raw/master/libpurple_kwallet_plugin.pl)
md5sums=('5922247493a7b3670d248056ac83791e')

package() {
  install -d -m755 ${pkgdir}/usr/lib/purple-2
  install -m644 ${srcdir}/libpurple_kwallet_plugin.pl ${pkgdir}/usr/lib/purple-2/
}
