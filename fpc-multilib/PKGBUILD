pkgname=fpc-multilib
pkgver=2.6.4
_gdbver=7.5.1
pkgrel=1
pkgdesc="The Free Pascal Compiler for multilib"
arch=('x86_64')
url="http://www.freepascal.org/"
license=('GPL' 'LGPL' 'custom')
backup=("etc/fpc.cfg")
depends=(ncurses zlib expat)
makedepends=(gcc-multilib fpc fpc-multilib-helper)
conflicts=(fpc ppcross386)
provides=(fpc=${pkgver} ppcross386)
options=(zipman staticlibs)
source=("ftp://ftp.freepascal.org/pub/fpc/dist/$pkgver/source/fpcbuild-$pkgver.tar.gz"
		http://ftp.gnu.org/gnu/gdb/gdb-${_gdbver}.tar.bz2
		fpc-gdb.patch)
md5sums=('403da132aed194fd841d46c3b33b022a'
         '3f48f468b24447cf24820054ff6e85b1'
         '1e45ece6b5d4ee60b860e75926b4122d')

build() {

  cd "${srcdir}/fpcbuild-$pkgver"
  export GDBLIBDIR=${srcdir}/gdb-${_gdbver}/gdb
  export LIBGDBFILE=$GDBLIBDIR/libgdb.a
  pushd fpcsrc/compiler
  fpcmake -v -w -Tx86_64-linux,i386-linux 
  popd 
  make NOGDB=1 CPU_TARGET=i386 build CROSSOPT="-Xd -Fl/usr/lib32 -Fl/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.2/32"
 
}

package() {
  cd "${srcdir}/fpcbuild-$pkgver"
 
  export HOME=$srcdir
  make -j1 CPU_TARGET=x86_64 NOGDB=1 PREFIX="${pkgdir}/usr" install
  make -j1 CPU_TARGET=i386 NOGDB=1 PREFIX="${pkgdir}/usr" crossinstall CROSSOPT="-XP -Fl/usr/lib32 -Fl/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.2/32"

  install -Dm0644 "fpcsrc/rtl/COPYING.FPC" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.FPC"

  ln -sv "/usr/lib/fpc/${pkgver}/ppcross386" "${pkgdir}/usr/bin/ppcross386"
  ln -sv "/usr/lib/fpc/${pkgver}/ppcx64" "${pkgdir}/usr/bin/"

  mkdir -p "${pkgdir}/etc"
  ${pkgdir}/usr/lib/fpc/${pkgver}/samplecfg "$pkgdir/usr/lib/fpc/${pkgver}" "${pkgdir}/etc"
  
  # use -fPIC by default
  echo -e "#ifdef cpux86_64\n# for x86_64 use -fPIC by default\n-Cg\n#endif" >> "$pkgdir/etc/fpc.cfg"

  mv "$pkgdir/usr/man" "$pkgdir/usr/share/"

  find "$pkgdir/etc/" -type f -exec sed -i "s|$pkgdir||g" {} \;
}
