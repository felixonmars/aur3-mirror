# Maintainer: Daniel Beecham <daniel@lunix.se>

pkgname=ddclient-wimpunk-git
pkgver=20141123
pkgrel=1
pkgdesc="Client for various DDNS services - wimpunk git version with Cloudflare support"
arch=('any')
url="http://github.com/wimpunk/ddclient"
license=('GPL2')
makedepends=('git')
depends=('perl-io-socket-ssl' 'perl-digest-sha1' 'perl-json-any')
conflicts=('ddclient' 'ddclient-git')
provides=('ddclient' 'ddclient-git')
backup=('etc/ddclient/ddclient.conf')
source=(git://github.com/wimpunk/ddclient ddclient.service)
md5sums=(SKIP SKIP)

package() {
  cd "$srcdir"/ddclient

  install -Dm 755 ddclient "$pkgdir"/usr/bin/ddclient
  install -d "$pkgdir"/var/cache/ddclient
  install -Dm 644 sample-etc_ddclient.conf "$pkgdir"/etc/ddclient/ddclient.conf
  install -Dm 644 "$srcdir"/ddclient.service "$pkgdir"/usr/lib/systemd/system/ddclient.service
}
