# Maintainer: Somasis <somasis@cryptolab.net>
# Submitter: defendor at riseup dot net
_pkgname=light-locker-settings
pkgname=light-locker-settings-bzr
pkgver=116
pkgrel=1
pkgdesc="Just a simple settings dialog for light-locker"
arch=('i686' 'x86_64')
url="https://launchpad.net/light-locker-settings"
license=('GPL3')
depends=('light-locker' 'python-gobject' 'python-psutil')
makedepends=('bzr' 'python' 'intltool')
source=("$_pkgname::bzr+https://code.launchpad.net/light-locker-settings/trunk")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    bzr revno
}

build() {
    cd "$_pkgname"
    ./configure --prefix="/usr"
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
