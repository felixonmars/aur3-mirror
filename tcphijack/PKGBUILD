# Maintainer: mail-duff@freenet.de
pkgname="tcphijack"
pkgver=1.1
pkgrel=1
pkgdesc="Simple proof of concept tool for injecting spoofed UPDATE's from ospfmon.com's bgptools"
arch=('i686' 'x86_64')
url="http://www.ospmon.com/docs/bgptools.htm"
license=('custom')
depends=('libpcap')
source=("http://www.cisco.com/public/support/${pkgname}-${pkgver}.tar.gz")
md5sums=('aaf17df34c93a91df5a9e2ba49d6adc4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's:PCAP = /usr/local/lib/libpcap.a:PCAP = /usr/lib/libpcap.so:' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p -m 755 "$pkgdir/usr/bin"
  install -m755 bgp-update-create "$pkgdir/usr/bin"
  install -m755 tcphijack "$pkgdir/usr/bin"
}

