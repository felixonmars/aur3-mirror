# Maintainer: hobbypunk <hoppe.marcel at gmail dot com>
# Contributor: hobbypunk <hoppe.marcel at gmail dot com>

pkgname=iscan-plugin-network-new
_pkgintname=iscan-network-nt
pkgver=1.1.1
_pkgver=1.1.1-1 # workaround for hyphen in package version
pkgrel=8
pkgdesc="Plugin for using Epson scanners with ISCAN over network. Based on old Pakage iscan-plugin-network"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYSPL')
depends=(iscan)
install=iscan-plugin-network.install
if [[ ${CARCH} = 'x86_64' ]]; then
md5sums=('b9fedf56f04b375df85c7d73d43a922d')
source=("iscan-network-nt.deb::http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/02/49/93/8ae846c4136f184c79686ea61e27fab8c6122644/iscan-network-nt_1.1.1-1_amd64.deb")
else
md5sums=('08b6cd88050151892bc582182cc8a2c0')
source=("iscan-network-nt.deb::http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/02/49/93/66556f92654bd1989cca2159f75742fd1dcb8f30/iscan-network-nt_1.1.1-1_i386.deb")
fi


build() {
cd $srcdir
bsdtar -xf data.tar.gz
}

package() {
cd $srcdir
cp -R usr $pkgdir
install -Dm644 usr/share/doc/${_pkgintname}/AVASYSPL.en.txt $pkgdir/usr/share/licenses/${pkgname}/AVASYSPL
}
