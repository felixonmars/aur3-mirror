# Maintainer: James Reed <supplantr at archlinux dot info>

_pkgname=suspend-usb-device
pkgname=$_pkgname-git
pkgver=20121113.12
pkgrel=1
pkgdesc='An easy-to-use script to properly suspend a USB device which can then be safely removed.'
arch=('any')
url='https://github.com/Thermionix/suspend-usb-device'
license=('GPL3')
depends=('systemd' 'grep' 'sed' 'sdparm')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://github.com/Thermionix/suspend-usb-device.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 suspend-usb-device "$pkgdir/usr/bin/suspend-usb-device"
}
