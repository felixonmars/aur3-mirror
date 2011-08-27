# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>
pkgname=emu51
pkgver=0.03a
pkgrel=1
pkgdesc="Software Graphical 8051 Emulator, based on Allegro."
arch=('i686')
url="http://emu51.sourceforge.net/"
license=('GPL')
depends=('allegro' 'gcc-libs')
install=
source=(http://downloads.sourceforge.net/sourceforge/emu51/emu51.zip
        http://www.final-memory.org/files/Makefile.emu51)
md5sums=('16d08edf3cc907c4a66cb1407a615d37'
         'e9276826827e9cea3c749bf1a9c86868')

build() {
  cd "$srcdir/$pkgname"

  cp ../Makefile.emu51 ./Makefile || return 1
  rm emu51.o
  make || return 1
  install -Dm755 $pkgname $startdir/pkg/usr/bin/$pkgname || return 1
}

# vim:set ts=2 sw=2 et:
