# Maintener: samlt

pkgname=ipv6toolkit
pkgver=1.5.3
pkgrel=1
pkgdesc='A security assessment and troubleshooting tool for the IPv6 protocols'
arch=('i686', 'x86_64')
url='http://www.si6networks.com/tools/ipv6toolkit/'
license=('GPL3')
depends=('libpcap')
source=("http://www.si6networks.com/tools/${pkgname}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('c7092d99184c5f591169f4705922482f91ed8e3758b073efd3a5f3efbaf6ca2d')

prepare() {
    cd "$pkgname-v$pkgver"
    # temporary fix (upstream aware of the problem)
    sed '/^\([[:space:]]*\)# Install the configuration file/ {
        s//&\n\1install -m0755 -d $(ETCPATH)/ }' {GNUm,M}akefile
}

build() {
    cd "$pkgname-v$pkgver"
    make
}

package() {
    cd "$pkgname-v$pkgver"

    install -dm755 $pkgdir/etc
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
    install -Dm644 CHANGES.TXT "$pkgdir/usr/share/doc/$pkgname/CHANGES.TXT"
}

