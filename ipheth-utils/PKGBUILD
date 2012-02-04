# Contributor: blasse <koralik(at)gmail(dot)com>
# Contributor: Erez Zarum <erez@erezzarum.com>
# Contributor: Nicolas Hureau <kalenz@lse.epita.fr>

pkgname=ipheth-utils
_realname=ipheth
pkgver=1.0
pkgrel=1
pkgdesc="Support for iPhone tethering through USB cables. Utils pkg, as driver is in kernel since 2.6.34"
arch=('i686' 'x86_64')
url="http://giagio.com/wiki/moin.cgi/iPhoneEthernetDriver"
license=(GPL)
depends=('libimobiledevice')
makedepends=('git' 'linux>2.6.33')
provides=("ipheth=$pkgver")
conflicts=(ipheth)
install=ipheth-utils.install
source=(http://github.com/downloads/dgiagio/$_realname/$_realname-$pkgver.tar.gz)
sha256sums=('c1f9fb0fed81fa284ccf5b939aad8dcb5f77faccf06636141a02ffd3c7941e77')

build() {
  cd "$srcdir/$_realname-$pkgver/ipheth-pair"
  make || return 1
  install -D -m755 ipheth-pair $pkgdir/lib/udev/ipheth-pair || return 1
  install -D -m644 90-iphone-tether.rules $pkgdir/etc/udev/rules.d/90-iphone-tether.rules || return 1
} 
