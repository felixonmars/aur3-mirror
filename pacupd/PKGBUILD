# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=pacupd
pkgver=0.1.0
pkgdesc="Simple script for upgrading Arch Linux system, using kdialog notifications"
pkgrel=1
arch=(i686 x86_64)
url="http://www.archlinux.org/"
license=(GPL)
makedepends=()
depends=(kdebase-workspace kdebase-kdialog pacman sudo)
options=()
install=${pkgname}.install
source=(aupdate.desktop
	pacupd)
md5sums=('6c01310766183bbad695eaf934e954be'
         'af22b3a8c04c8b8990502ee6783c5084')

build() {
    install -D -m 755 ${srcdir}/pacupd ${pkgdir}/usr/bin/pacupd || return 1
    install -D -m 755 ${srcdir}/aupdate.desktop ${pkgdir}/usr/share/applications/aupdate.desktop || return 1
}