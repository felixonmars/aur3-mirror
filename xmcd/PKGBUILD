# Maintainer: Roland Schaeuble <rschaeuble@gmx.ch>
pkgname=xmcd
pkgver=3.3.2
pkgrel=1
pkgdesc="Xmcd is a full-featured CD Player and Ripper software package"
url="http://www.amb.org/xmcd/"
license=""
depends=(lesstif)
makedepends=()
conflicts=()
replaces=()
backup=()
install=(xmcd.install)
source=("http://www.ibiblio.org/tkan/download/xmcd/3.3.2/bin/linux-x86-libc6/xmcdbin.tar.gz")
md5sums=('fec093fb1cd1b3ba9e10a702ac22f3e6')

build() {
  cd $startdir/src/xmcdbin
  chmod +x install.sh
  BATCH_BINDIR="$startdir/pkg/usr/X11R6/bin" \
  BATCH_XMCDLIB="$startdir/pkg/usr/lib/X11/xmcd/lib-Linux-i686" \
  BATCH_DISCOGDIR="$startdir/pkg/usr/lib/X11/xmcd/discog" \
  BATCH_MANDIR="$startdir/pkg/usr/X11R6/man" \
 ./install.sh -b -b
}
