# Contributor: Bas Ammerlaan <steelbas[at]gmail.com>
# Based on the wicd-eduroam package submitted by Ander Martinez.

pkgname='wicd-eduroam-uu'
pkgver=1
pkgrel=2
pkgdesc="Wicd template for the eduroam network as used in the University of Utrecht (configured using PEAP with MSCHAPV2). Also confirmed for a number of other educational institutes, check package comments. Based on oredakore's wicd-eduroam package."
arch=('any')
url="http://wicd.sourceforge.net/"
license=('WTFPL')
groups=()
depends=('wicd')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=eduroam-uu.install
source=(eduroam-uu)
noextract=()
md5sums=('9f9d1ac1b3885e9fc1536c3131eca573')

build(){
    install -Dm 644 eduroam-uu $pkgdir/etc/wicd/encryption/templates/eduroam-uu
}

