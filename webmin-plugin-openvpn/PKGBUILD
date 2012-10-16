# Maintainer: Edouard Kleinhans <edouard@kleinhans.info>

pkgname=webmin-plugin-openvpn
pkgver=2.5
pkgrel=1
pkgdesc="Openvpn plugin for webmin"
url=http://www.openit.it/index.php?option=com_content&view=section&id=12&Itemid=88
license=(GPL)
arch=(any)
depends=(webmin openvpn)
install=$pkgname.install
source=(http://www.openit.it/downloads/OpenVPNadmin/openvpn-2.5.wbm.gz $pkgname.conf)
sha256sums=('c1562cd0277a6d73527707e51350749d87bc2d42c1baa37b8e8412aeaca513d6'
    'bea231d4eea161814a9b483b6a1b32f73a938daf49e2099ec234835aff570b80')

package() {
    cd "$srcdir"
    install -d "$pkgdir"/opt/webmin/
    cp -rf openvpn/ $pkgdir/opt/webmin/
    sed 's|^#!/usr/local/bin/perl|#!/usr/bin/perl|g' -i "$pkgdir"/opt/webmin/openvpn/*.cgi
    install -Dm644 $pkgname.conf "$pkgdir"/etc/webmin/openvpn/config
}
