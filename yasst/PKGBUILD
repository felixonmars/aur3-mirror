# Contributor: Matías Hernández  <msdark@archlinux.cl>
pkgname=yasst
pkgver=20101005
pkgrel=6
pkgdesc="A lightweight multiplatform twitter thingymbob, created with Qt framework"
arch=(i686 x86_64)
url="http://www.yasst.org"
license=('GPL')
groups=(network)
depends=(libjpeg qt gstreamer0.10-base)
install=
source=(http://www.yasst.org/files/yasst-Linux-i686.tgz)
noextract=()
md5sums=('3869a0628be73cfbe3f8d076e2b2d3db')

build() {
  cd "$srcdir/$pkgname-linux"
  mkdir -p $pkgdir/usr/bin/yasst || return 1
  cp -r * $pkgdir/usr/bin/yasst  || return 1
  install -D -m755 Yasst.sh $pkgdir/usr/bin/yasst/Yasst.sh
    
}

# vim:set ts=2 sw=2 et:
