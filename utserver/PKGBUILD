# Maintainer: Frikilinux <frikilinux at gmail.com>
# Contributor: Carl Reinke <mindless2112 gmail com>
pkgname=utserver
pkgver=30470
pkgrel=2
pkgdesc='uTorrent server, BitTorrent client with web UI'
url='http://www.utorrent.com/downloads/linux'
license=('custom')
install="$pkgname.install"
source=("utserver-${pkgver}.tar.gz::http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-ubuntu-13-04/track/beta/"
        'utserver' 'utserver.conf' 'utserver.service')
sha256sums=('6e4f836d5ca6bc5ec48632b4e425a936d1a09ab38a6ed2ab8d7016dd8e2b81bf'
            '71fd1091e3ffa59ee7ed47d37b634c572080ef8db517cda29f0f4b4c0324e23c'
            'bc4fc09f99f1f234ee32bf7b12cfc13ff3c7fed062b2d0ea65acd5d70f4dbde1'
            '0d36aed779af4b18c7820a87dc439769d660af2a929f268298fe3486ed73a5fc')


arch=('i686' 'x86_64')
depends=('bash' 'openssl' 'zlib')
makedepends=('unzip')
backup=('etc/utserver.conf')
conflicts=('utorrent-server')

if [[ "$CARCH" == i686 ]]
then
    source[0]="utserver-${pkgver}.tar.gz::http://download-new.utorrent.com/endpoint/utserver/os/linux-i386-ubuntu-13-04/track/beta/"
    sha256sums[0]='ec8bbe21eb3fab14f725c0d3ea648b61d035bf8a2871bb006abd3405f99ed067'
#    depends=('bash' 'openssl098' 'zlib')
fi

package()
{
    install -dm755 ${pkgdir}/srv/utserver/{downloads,settings,torrents}
    install -dm755 ${pkgdir}/usr/share/utserver/webui
    install -dm755 ${pkgdir}/usr/share/doc/utserver
    
    cd ${srcdir}/utorrent-server-alpha-v3_3
    install -Dm755 utserver ${pkgdir}/usr/share/utserver/utserver
    install -m644 docs/* ${pkgdir}/usr/share/doc/utserver
    unzip webui.zip -d ${pkgdir}/usr/share/utserver/webui
    install -Dm644 docs/license.txt ${pkgdir}/usr/share/licenses/utserver/LICENSE
    
    cd $srcdir
    install -Dm755 utserver ${pkgdir}/usr/bin/utserver
    install -Dm644 utserver.conf ${pkgdir}/etc/utserver.conf
    install -Dm644 utserver.service ${pkgdir}/usr/lib/systemd/system/utserver.service
}
