# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-countryloginmessage
pkgver=1.2
pkgrel=1
pkgdesc="Alternate login message for Bukkit"
arch=(any)
url="https://github.com/xPaw/CountryLoginMessage/"
license=('GPL')
depends=('craftbukkit' 'geoip')
source=('https://github.com/xPaw/CountryLoginMessage/blob/master/CountryLoginMessage.jar?raw=true' 'config.yml')
md5sums=('7c4eb1f935b43212800f737c0e6dfc6f'
         '434a935afc79a999e21b8be34f724409')

package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins/CountryLoginMessage"
  install -m 644 -T "$srcdir/CountryLoginMessage.jar?raw=true" "$pkgdir/opt/craftbukkit/plugins/CountryLoginMessage.jar"
  install -m 644 "$srcdir/config.yml" "$pkgdir/opt/craftbukkit/plugins/CountryLoginMessage"
}

# vim:set ts=2 sw=2 et:
