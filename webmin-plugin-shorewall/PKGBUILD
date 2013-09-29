# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: vbPadre <vbpadre@gmail.com>

pkgname=webmin-plugin-shorewall
pkgver=1.650
pkgrel=1
pkgdesc="Shorewall firewall plugin for webmin"
arch=(any)
url=http://www.webmin.com/standard.html
license=(BSD)
depends=(webmin)
install=$pkgname.install
source=(http://download.webmin.com/download/modules/shorewall.wbm.gz
    $pkgname.conf)
sha256sums=('a7f4b5b0352aa4f22a101db33d7b35bf4a01a166bde4e2700762a352af9c39ce'
    '2f29accb36a79b1121b34236c96ea25710010b2df3893dfb00f2490d2d1b35cd')
sha512sums=('290a2dc75b43bc0f5103b411ba479b542dd74f43f6b0839c93e623302472019817c58b07abb48acdd38d9ad587246bd01cbf1320f2bbc4d133b3064562e333dc'
    '76ea7f404e679bbd00528df7e554d441c79fc348e584812bee60d1bfbe10ba3964118258da23165b225237ad723d34330c22f3cc29a511b0e6d717ec6b40cad1')

package() {
    install -d "$pkgdir"/opt/webmin/
    cp -rf shorewall/ $pkgdir/opt/webmin/
    sed 's:^#!/usr/local/bin/perl:#!/usr/bin/perl:g' -i "$pkgdir"/opt/webmin/shorewall/*.cgi
    install -Dm644 $pkgname.conf "$pkgdir"/etc/webmin/shorewall/config
}
