# Contributor: Peter Vanusanik <enerccio@gmail.com>
pkgname=bfe2
pkgver=20100519
pkgrel=19may2010
pkgdesc="Debugging frontend for the bochs x86 portable emulator."
arch=(i686 x86_64)
url="http://bochs.sourceforge.net/"
license=('OSI-Approves')
depends=(gtk bochs-with-debugger)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
file=bfe2-19may2010.tar.gz
source=(http://sourceforge.net/projects/bfe/files/source/19may2010/bfe2-19may2010.tar.gz)
noextract=()
md5sums=('37b6295a6fa76cae9f8d618a893789a6')

build() {

  mkdir $startdir/pkg/usr
  mkdir $startdir/pkg/usr/bin
  mkdir $startdir/pkg/usr/local
  mkdir $startdir/pkg/etc
  cd $startdir/src/
  tar -xf ${file}

  cd bfe2
  ./configure.sh --prefix $startdir/pkg/usr --sysconfdir $startdir/pkg/etc --bochs-path /usr/bin/bochs  --gtk 1.2
  make || return 1
  make DESTDIR=$startdir/pkg install

}
