# $Id$
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=mingw32-readline
_basever=6.2
_patchlevel=001 #prepare for some patches
pkgver=$_basever.$_patchlevel
pkgrel=1
pkgdesc="GNU readline library"
arch=('i686' 'x86_64')
url="http://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
depends=()
options=('!emptydirs' '!strip' '!buildflags')
source=("http://ftp.gnu.org/gnu/readline/readline-$_basever.tar.gz")
if [ $_patchlevel -gt 00 ]; then
    for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
        source=(${source[@]} http://ftp.gnu.org/gnu/readline/readline-$_basever-patches/readline${_basever//./}-$(printf "%03d" $p))
    done
fi
md5sums=('67948acb2ca081f23359d0256e9a271c'
         '83287d52a482f790dfb30ec0a8746669')

build() {
  unset LDFLAGS
  cd ${srcdir}/readline-$_basever
  for p in ../readline${_basever//./}-*; do
    [ -e "$p" ] || continue
    msg "applying patch ${p}"
    patch -Np0 -i ${p}
  done

  # Remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf

  ./configure --prefix=/usr/i486-mingw32 --build=$CHOST --host=i486-mingw32
  #make SHLIB_LIBS=-lncurses
  make
}

package() {
  cd ${srcdir}/readline-$_basever
  make DESTDIR=${pkgdir} install
  
  #install -Dm644 ${srcdir}/inputrc ${pkgdir}/etc/inputrc

  # FHS recommends only shared libs in /lib
  #install -dm755 $pkgdir/usr/lib
  #mv $pkgdir/lib/*.a $pkgdir/usr/lib

  # to make the linker find the shared lib and fix compile issues
  #cd ${pkgdir}/usr/lib
  #ln -sv /lib/libreadline.so .
  #ln -sv /lib/libhistory.so .
}

