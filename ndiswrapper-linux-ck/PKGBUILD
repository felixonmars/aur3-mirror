# Maintainer: cip91 <cip91sk at gmail . com>
# Contributor: Thorsten TÃ¶pper <atsutane-tu@freethoughts.de>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_linux=3.13
_linuxnext=3.14
_extramodules=extramodules-$_linux-ck
_kver="$(cat /lib/modules/${_extramodules}/version)"
_pkgname=ndiswrapper
pkgname=$_pkgname-linux-ck
pkgver=1.59
pkgrel=10
pkgdesc="Module for NDIS (Windows Network Drivers) drivers supplied by vendors. For linux-ck-$_linux"
license=('GPL')
arch=('i686' 'x86_64')
url="http://ndiswrapper.sourceforge.net"
install=$_pkgname.install
depends=("linux-ck>=$_linux" "linux-ck<$_linuxnext" 'wireless_tools' 'perl')
makedepends=("linux-ck-headers>=$_linux" "linux-ck-headers<$_linuxnext")
#conflicts=("$_pkgname")
provides=("$_pkgname-utils" "$_pkgname-bin")
replaces=("$_pkgname-utils" "$_pkgname-bin")
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz")

options=('!strip')
md5sums=('e26a7213468ccd6b0bb4c211c7aadeaa')

(
cat <<EOF
post_install() { 
	post_upgrade 
}
post_upgrade(){ 
	depmod $_kver 
}
post_remove() { 
	post_upgrade 
}
EOF
) > $startdir/$_pkgname.install


build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make KVERS=$_kver
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make INST_DIR="lib/modules/$_extramodules" \
    KVERS=$_kver DESTDIR="$pkgdir/" install

  gzip "$pkgdir/lib/modules/$_extramodules/$_pkgname.ko"
}

# vim:set ts=2 sw=2 et:
