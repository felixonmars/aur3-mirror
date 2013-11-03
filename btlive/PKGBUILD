# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=btlive
pkgver=0.4.12.335
pkgrel=1
pkgdesc="Bittorrent Live is a technology for p2p live streaming, client version"
arch=('i686' 'x86_64')
url="http://live.bittorrent.com"
_watch=('http://live-installer-autoupdate.s3.amazonaws.com/latest_version.js','([\d.]*\d+)')
license=('nonfree')
depends=('python2' 'sensible-utils' 'python2-distribute' 'pygtk')
if [ "${CARCH}" = "x86_64" ]; then
    _arch="amd64"
    sha512sums=('c0fe5138e5a2469ddb27cf98af74092868fddb5086e191e9424dcb038eb6ee663c1325d7492503bcab351729a2c2cd1baf785375a1252d59938ca45819c2bfc1'
                'b2151d059fc5856fea4fecb9a64ce2fc874d9356f0908fbbd66d938e9b7e95d3a65c76024c8c15d7b579d74cd832c0e02bfee3953292345dcfeca19c4374da70')
else
    _arch="i386"
    sha512sums=('542396581bf1d9c228977fe45d1d6008b38e2a648d038597de4f1b7e856a2e81e80d40cf9e99fff30c16aa4a51810c16fe69686a4b52417690eb2bf36e18fc6b'
                'b2151d059fc5856fea4fecb9a64ce2fc874d9356f0908fbbd66d938e9b7e95d3a65c76024c8c15d7b579d74cd832c0e02bfee3953292345dcfeca19c4374da70')

fi 
source=("http://live-installer-autoupdate.s3.amazonaws.com/${pkgname}_${pkgver}_${_arch}.deb"
        "${pkgname}.service")
options=('!strip')

package () {
    cd $srcdir
    ar x "${pkgname}_${pkgver}_${_arch}.deb"
    tar -xvf data.tar.gz -C "${pkgdir}/"

    # Create btlive service
    install -Dm644 "${srcdir}/btlive.service" "${pkgdir}/usr/lib/systemd/system/btlive.service"
}

# vim:set ts=4 sw=4 et:
