# Maintainer: Bryan Allred <bryan@revolvingcow.com>

_pkgname=i3status-update-network
pkgname=$_pkgname-git
pkgver=20140620
pkgrel=1
pkgdesc="Simple script to update the i3status configuration file with the current network devices"
arch=('i686' 'x86_64')
url="https://github.com/revolvingcow/i3status-update-network"
license=("GPL2")
depends=('i3status')
makedepends=('git')
providers=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/revolvingcow/i3status-update-network.git#branch=master")
sha256sums=("SKIP")

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/${_pkgname}/i3status-update-network ${pkgdir}/usr/bin/i3status-update-network
}
