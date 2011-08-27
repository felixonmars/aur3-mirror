# Contributor: Cedric GESTES <ctaf42@gmail.com>
pkgname=udev-tascam-usx2y
pkgver=0.0.1
pkgrel=1
pkgdesc="udev rules for tascam us428 and us224"
arch=('i686' 'x86_64')
url="http://www.ctaf.free.fr/dokuwiki/doku.php?id=archlinux#us428"
license=('GPL')
depends=('fxload' 'udev' 'alsa-firmware' 'alsa-tools')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
groups=()
options=()
install=
source=()
noextract=()
md5sums=()

build() {
  mkdir -p $startdir/pkg/etc/udev/rules.d/
  cp $startdir/55-tascam-usx2y.rules $startdir/pkg/etc/udev/rules.d/
}


#depends=('libpng' 'glibc' 'libx11' 'libice' 'zlib' 'libxau' 'libxdmcp')

