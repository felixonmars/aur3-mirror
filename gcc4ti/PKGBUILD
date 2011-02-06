# Maintainer: PyroPeter <com.googlemail@abi1789>

pkgname=gcc4ti
pkgver=0.96_beta_10
pkgrel=1
pkgdesc="SDK for TI calculators (fork of tigcc)"
arch=('i686' 'x86_64')
url="http://trac.godzil.net/gcc4ti/"
license=('GPL')
depends=('sh')
makedepends=('subversion' 'make' 'gcc>=2.95' 'patch' 'bison' 'flex')
optdepends=('qt3: For gcc4tidoc')
install=gcc4ti.install
options=('!strip')
source=('http://lionel.debroux.free.fr/pub/.GCC4TI/0.96Beta10/gcc4ti_src.tar.bz2'
        'ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-4.1.2/gcc-core-4.1.2.tar.bz2'
        'ftp://ftp.fu-berlin.de/unix/gnu/binutils/binutils-2.16.1.tar.bz2'
        'tigcc.a::http://www.mirari.fr/sncx'
        'sprites.h'
        'stdlib.h'
        'envreg')
noextract=('gcc-core-4.1.2.tar.bz2' 'binutils-2.16.1.tar.bz2')
md5sums=('bbea725f8437147c946041fd9f956282' '2af3fb599635219171c6ae1f3034888a' '6a9d529efb285071dad10e1f3d2b2967' 'b928789e2ea53ea8e7c8a48247582a0f' 'a1cfc1ddfe4aa0af9c629197f609ea5b' '9ee7d4574f33847e8f205520ca58ec1b' '1b2e40cae1b909ef07dc4f0d8c0b5805')

build() {
  cd "$srcdir"
  
  mkdir -p "$pkgdir/opt"
  export PREFIX_GCC4TI="$pkgdir/opt/gcc4ti"
  export PATH="$PATH:$PREFIX_GCC4TI/bin"
  export CFLAGS='-Os -s'
  cd scripts
  ./Install_All
  
  # workaround for bad install script
  cd "$pkgdir/opt/gcc4ti"
  sed -i -- 's!assistant -!/opt/qt/bin/assistant -!' bin/gcc4tidoc
  rm doc/tigcclib
  ln -fs html doc/tigcclib
  ln -fs os.h include/asm/OS.h
  install -m755 "$srcdir/envreg" bin/envreg
  
  # fixing sprite bug:
  # http://trac.godzil.net/gcc4ti/wiki/SprtRoutinesFix
  install -m644 "$srcdir/tigcc.a" lib/
  install -m644 "$srcdir/sprites.h" include/c/
  install -m644 "$srcdir/stdlib.h" include/c/
}
