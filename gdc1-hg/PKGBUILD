# Contributor: Jerome Berger <jeberger@free.fr>
pkgname=gdc1-hg
pkgver=566
_gccver=4.5.1
pkgrel=1
pkgdesc="GDC, Digital Mars D Programing Language (DMD) frontend for GCC (D1 version)"
arch=(i686 x86_64)
url="http://bitbucket.org/goshawk/gdc/wiki/Home"
license="GPL"
provides=('gdc')
depends=("gcc>=$_gccver")
makedepends=('mercurial')
conflicts=('gdc' 'gdc-svn' 'gdc2-hg')
options=('!libtool' '!emptydirs')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${_gccver}/gcc-core-${_gccver}.tar.bz2
        gdc-stdlib)
md5sums=('dc8959e31b01a65ce10d269614815054'
         '53aa15db4c14ed98ee8bda2707537a2e')

_hgroot=http://bitbucket.org/goshawk
_hgrepo=gdc

build() {
   cd $srcdir

   rm -rf $srcdir/gcc-$_gccver-build $srcdir/gcc-build
   mv $srcdir/gcc-$_gccver $srcdir/gcc-$_gccver-build
   ln -s $srcdir/gdc/d $srcdir/gcc-$_gccver-build/gcc

   cd gcc-$_gccver-build
   ./gcc/d/setup-gcc.sh

   export MAKEFLAGS="-j1"

   # Don't install libiberty 
   sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

   # Don't run fixincludes
   sed -i -e 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

   mkdir ../gcc-build
   cd ../gcc-build
   # Note: the "CC=$(which gcc)" is necessary to work around a gcc bug that
   # causes the build to fail if "." is in the path.
   CC=$(which gcc) ../gcc-$_gccver-build/configure --prefix=/usr \
       --enable-languages=d --enable-threads=posix  --enable-__cxa_atexit \
       --disable-multilib --libdir=/usr/lib --libexecdir=/usr/lib \
       --disable-shared --disable-bootstrap
   make
}

package() {
   cd $srcdir/gcc-build

   DESTDIR=$pkgdir make install-target-libgcc install-target-libphobos
   DESTDIR=$pkgdir make -C gcc d.install-common d.install-man d.install-normal
   install -Dm 755 gcc/cc1d $pkgdir/usr/bin/cc1d

   cd $pkgdir/usr
   if [[ $CARCH == "x86_64" ]]; then
      mv lib64/libgphobos.a lib/libgphobos.a
      rmdir lib64
   fi

   cd $pkgdir/usr/include/d/${_gccver}
   mv object.d object.d.phobos
   ln -s object.d.phobos object.d
   mv std std.phobos
   ln -s std.phobos std

   install -Dm 755 $startdir/gdc-stdlib $pkgdir/usr/bin
}
