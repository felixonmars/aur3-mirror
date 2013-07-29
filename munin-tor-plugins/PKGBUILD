# Maintainer: Joris Steyn <jorissteyn@gmail.com>
pkgname=munin-tor-plugins
pkgver=1.0.0
pkgrel=1
pkgdesc='Munin plugins for Tor statistics'
arch=('any')
url='http://munin-monitoring.org/wiki/plugin-tor_connections'
license=('unknown')
depends=('munin-node')
makedepends=('')
source=("http://munin-monitoring.org/raw-attachment/wiki/plugin-tor_connections/tor_connections"
        "http://munin-monitoring.org/raw-attachment/wiki/plugin-tor_traffic/tor_traffic"
        munin-tor.conf)
md5sums=('53d89e957fe4b9f283e48c8173221d63'
         '2e65eb9899db11f84bf1a29980c2922f'
         '6bd10abf2f396368c43b6d119db94545')

package() {
  install -D -m 755 "$srcdir"/tor_connections "$pkgdir"/usr/lib/munin/plugins/tor_connections
  install -D -m 755 "$srcdir"/tor_traffic "$pkgdir"/usr/lib/munin/plugins/tor_traffic
  install -D -m 644 "$srcdir"/munin-tor.conf "$pkgdir"/etc/munin/plugin-conf.d/tor.conf
}

# vim:set ts=2 sw=2 et:
