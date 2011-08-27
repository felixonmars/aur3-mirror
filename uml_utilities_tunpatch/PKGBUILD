# Contributor: Nicola Tuveri <nic dot tuv at google mail dot com>

pkgname=uml_utilities_tunpatch
pkgver=20070815
pkgrel=1
pkgdesc="User Mode Linux Utilities - patched to let tunctl handle tun devices"
arch=(i686 x86_64)
depends=('fuse' 'readline')
provides=('uml_utilities')
conflicts=('uml_utilities')
url="http://user-mode-linux.sourceforge.net/"
source=(
	"http://user-mode-linux.sourceforge.net/uml_utilities_${pkgver}.tar.bz2"
	'tunctl-IFF_TUN.patch'
)
license=('GPL2')
md5sums=('b0468ac8b79cef53f36f5f9517907462'
         'cf03411576d2666c3ca1293f76e75d80')

build() {
  cd $startdir/src/tools-$pkgver
  patch -p1 < $startdir/src/tunctl-IFF_TUN.patch || return 1
  sed 's|lib64|lib|g' -i Makefile || return 1
  CFLAGS="$CFLAGS -DTUNTAP -g -Wall"
  make all|| return 1
  make DESTDIR=$startdir/pkg install || return 1
  chown root $startdir/pkg/usr/bin/*
}
