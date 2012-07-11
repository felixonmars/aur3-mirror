# Matt: Maintainer <matkam gmail>
pkgname=okcupid-pidgin
pkgver=2.05
pkgrel=2
pkgdesc="This plugin gets to be the only plugin ever made that will connect OkCupid's online messenger to the Pidgin Instant Messaging program"
arch=('i686' 'x86_64')
url="http://code.google.com/p/okcupid-pidgin/"
license=('GPL v3')
depends=('pidgin' 'json-glib')

_plugin="libokcupid-$pkgver.so"
if [ "${CARCH}" == x86_64 ]; then
  _plugin="libokcupid64-$pkgver.so"
fi
source=(http://okcupid-pidgin.googlecode.com/files/$_plugin)

md5sums=('8a0e79288186833eef2221555943a9c2')
if [ "${CARCH}" == x86_64 ]; then
  md5sums=('40aa057b95260ac4553f677687856d65')
fi

package() {
  cd "$srcdir"
  install -m755 -d "${pkgdir}/usr/lib/purple-2/" || return 1
  install -m755 $_plugin "${pkgdir}/usr/lib/purple-2/" || return 1
}

# vim:set ts=2 sw=2 et:
