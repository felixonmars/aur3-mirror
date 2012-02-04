# Maintainer: tddenz t0psisdamn@gmail.com
pkgname=radioshark2
pkgver=1
pkgrel=1
pkgdesc="This is a program that lets you control your radioshark usb fm/am radio tuner from linux. This souce code written my Michael Rolig (email: michael_rolig@alumni.macalester.edu) This can be considered to be in the public domain, Modified for Radio Shark2 2007-05-11, This source code is written by Hisaaki Shibata (email: shibata@luky.org), Original Shark2 controll code in Delphi is written by Kawabe (email: mail.kwb@gmail.com) This can be considered to be in the public domain."
arch=(any)
url="http://hoop.euqset.org/archives/058605.html"
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
cp ${startdir}/shark2.c ${srcdir}/
cd ${srcdir}
gcc shark2.c -lhid -o shark2
}

package() {
mkdir ${pkgdir}/usr
mkdir ${pkgdir}/usr/bin
mv ${srcdir}/shark2 ${pkgdir}/usr/bin
}
