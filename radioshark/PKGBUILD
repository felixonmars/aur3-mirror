# Maintainer: tddenz t0psisdamn@gmail.com
pkgname=radioshark
pkgver=1
pkgrel=1
pkgdesc="This is a program that lets you control your radioshark 1 usb fm/am radio tuner from linux. This souce code written my Michael Rolig (email: michael_rolig@alumni.macalester.edu) This can be considered to be in the public domain, Modified for Radio Shark2 2007-05-11, This source code is written by Hisaaki Shibata (email: shibata@luky.org), Original Shark2 controll code in Delphi is written by Kawabe (email: mail.kwb@gmail.com) This can be considered to be in the public domain."
arch=(any)
url="http://javier.rodriguez.org.mx/index.php/2006/06/10/griffin-radio-shark-icecast2-on-debian-gnulinux"
license=('Public Domain')
groups=()
depends=(libhid)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
md5sums=() #generate with 'makepkg -g'

build() {
cp ${startdir}/shark.c ${srcdir}/
cd ${srcdir}
gcc shark.c -lhid -o shark
}

package() {
mkdir ${pkgdir}/usr
mkdir ${pkgdir}/usr/bin
mv ${srcdir}/shark ${pkgdir}/usr/bin
}
