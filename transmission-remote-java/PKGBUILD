# Maintainer: vn158 <vn158 at seznam dot cz>
pkgname=transmission-remote-java
pkgver=0.15.20.1041
_pkgver=0.15.20-1041
pkgrel=1
pkgdesc="Cross platform remote control GUI for the Transmission BitTorrent client."
arch=('i686' 'x86_64')
url="http://code.google.com/p/transmission-remote-java/"
license=('GPL3')
groups=()
depends=(java-runtime)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
#install=
#changelog=

source=($pkgname $pkgname.desktop http://transmission-remote-java.googlecode.com/files/transmission-remote-java-${_pkgver}-bin.jar http://code.google.com/p/transmission-remote-java/logo)
noextract=(transmission-remote-java-${_pkgver}-bin.jar)
md5sums=('ff68b65480d881fd4e60925ebf20ffbf' '7c5a1fddb13d00cf59bcdf8eeee3d054'
         '056859d1987621c1ac383a2d130cd290' '8854d809692a81cdcf8293ef98c899e1')

build() {
  :
}

package() {
  cd "$startdir"
  install -d -m755 $startdir/pkg/usr/share/$pkgname
  install -d -m755 $startdir/pkg/usr/bin
  install -m644 *.jar $startdir/pkg/usr/share/$pkgname
  install -m755 $pkgname $startdir/pkg/usr/bin

  install -d -m755 $startdir/pkg/usr/share/pixmaps
  install -m644 logo $startdir/pkg/usr/share/pixmaps/$pkgname.png

  install -d -m755 $startdir/pkg/usr/share/applications
  install -m644 $pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
}
