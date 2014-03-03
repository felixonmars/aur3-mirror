# Maintainer: Yachi Lo <yaachi@gmail>
# Contributor: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgprefix=ddclient
pkgname=$pkgprefix-cloudflare
pkgver=3.8.2
pkgrel=1
pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services with Cloudflare support"
arch=('any')
url="http://blog.peter-r.co.uk/cloudflare-ddclient-patch.html"
license=('GPL2')
depends=('perl-io-socket-ssl' 'perl-digest-sha1' 'net-tools' 'perl-json-any')
conflicts=('ddclient')
backup=('etc/ddclient/ddclient.conf')
cloudflare_patch="ddclient-3.8.0-cloudflare-26-09-2013"
source=(http://downloads.sourceforge.net/sourceforge/$pkgprefix/$pkgprefix-$pkgver.tar.bz2
        $cloudflare_patch.patch
        $pkgprefix.service)
md5sums=('62cd5fe93ced2c794d5f441f9d908841'
         'a6256ce3f78465e9f2bb3ddb40633726'
         '1bcd3e75309e658931532adef2a0608a')

package() {
  cd "$srcdir"/$pkgprefix-$pkgver

  patch < ../../$cloudflare_patch.patch

  install -Dm755 $pkgprefix "$pkgdir"/usr/bin/$pkgprefix
  install -Dm600 sample-etc_$pkgprefix.conf "$pkgdir"/etc/$pkgprefix/$pkgprefix.conf
  install -d "$pkgdir"/var/cache/$pkgprefix
  install -Dm644 "$srcdir"/$pkgprefix.service "$pkgdir"/usr/lib/systemd/system/$pkgprefix.service

  install -Dm644 README.cisco "$pkgdir"/usr/share/doc/$pkgprefix/README.cisco
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgprefix/README.md
  install -Dm644 README.ssl "$pkgdir"/usr/share/doc/$pkgprefix/README.ssl
  install -Dm644 sample-etc_cron.d_$pkgprefix "$pkgdir"/usr/share/doc/$pkgprefix/sample-etc_cron.d_$pkgprefix
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgprefix/COPYING
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgprefix/COPYRIGHT
}
