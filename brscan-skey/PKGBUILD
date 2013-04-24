pkgname=brscan-skey
pkgver=0.2.4_0
pkgrel=2
pkgdesc="Brother scan-key-tool"
depends=('sane' 'sed')
makedepends=('libarchive')
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL' 'custom:Brother commercial license')
install=brscan-skey.install
if [ $CARCH = 'x86_64' ]; then
    source=("http://pub.brother.com/pub/com/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.x86_64.rpm")
    md5sums=('494f7256c8e0ee643157e7dba58ff6d4')
else
    source=("http://pub.brother.com/pub/com/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.i386.rpm")
    md5sums=('f6ac581adc9cab92551a0aa17508ab62')
fi

build() {
    mkdir -p "$srcdir"/usr/bin
    ln -sf /opt/brother/scanner/brscan-skey/brscan-skey "$srcdir"/usr/bin/brscan-skey
}

package() {
    cp -R "$srcdir"/{opt,usr} "$pkgdir"
}
