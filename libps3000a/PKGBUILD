# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Alexandre Bique <>
pkgname=libps3000a
pkgver=1.3.0
pkgrel=1
pkgdesc="picotech oscilloscope driver"
arch=('x86_64')
url="http://www.picotech.com/linux.html"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://labs.picotech.com/debian/pool/main/libp/libps3000a/libps3000a_1.3.0-6r54_amd64.deb")
md5sums=('ec70598c0f0cf86ad554a27628fbfe59')
noextract=()

build() {
  echo
}

package() {
  dpkg --extract libps3000a_1.3.0-6r54_amd64.deb $startdir/pkg/$pkgname
  chmod -R go-w $startdir/pkg/$pkgname
  chown -R root:root $startdir/pkg/$pkgname
}

# vim:set ts=2 sw=2 et:
