pkgname=brscan-skey
pkgver=0.2.4_1
pkgrel=7
pkgdesc="Brother scan-key-tool"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/s/id/linux/en"
license=('custom:Brother')
install=brscan-skey.install
if [ $CARCH = 'x86_64' ]; then
    source=("http://pub.brother.com/pub/com/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.x86_64.rpm")
    md5sums=('9ad29a0ef9f8f4d6f742fb4293ee08a6')
else
    source=("http://pub.brother.com/pub/com/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.i386.rpm")
    md5sums=('c6bc7a501f424541130a1b9a38b76493')
fi
source+=('brscan-skey.service' 'brscan-skey-user.service' 'LICENSE.html')
md5sums+=('82ba4e7cf73306b17f144731f6484ad0' 'da65d820642f760115428769d2639db9' 'bd06a5d28abb3b3a3a6a263567cbb78b')

package() {
    cp -R "$srcdir"/opt "$pkgdir"

    install -d -m755 "$pkgdir"/usr/lib/systemd/system
    install -D -m644 "$srcdir"/brscan-skey.service "$pkgdir"/usr/lib/systemd/system

    install -d -m755 "$pkgdir"/usr/lib/systemd/user
    install -D -m644 "$srcdir"/brscan-skey-user.service "$pkgdir"/usr/lib/systemd/user/brscan-skey.service

    install -d -m755 "$pkgdir"/usr/share/licenses/$pkgname
    install -D -m644 "$srcdir"/LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname
}
