# Contributor: Jerome Berger <jeberger@free.fr>
# Maintainer: Jesus Alvarez <jeezusjr@gmail.com>

# See http://gcc.gnu.org/install/prerequisites.html

pkgname=gdc2-hg
pkgver=793
pkgrel=1
_gccver=4.6.2
pkgdesc="GDC, The D Programming Language (DMD) frontend for GCC (D2 version)"
arch=('i686', 'x86_64')
url="http://bitbucket.org/goshawk/gdc/wiki/Home"
license=('GPL')
provides=('gdc')
depends=("perl>=5.6.1")
makedepends=('mercurial' 'binutils>=2.22' 'libmpc' 'cloog' 'ppl')
conflicts=('gdc' 'gdc1-hg')
options=('!libtool' '!emptydirs')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${_gccver}/gcc-core-${_gccver}.tar.bz2
	gcc_pure64.patch
	gcc-hash-style-both.patch
	gcc-4.6.2-cloog-0.17.patch)
md5sums=('780f614ab18c7a9066dec6387d7490b2'
         '4030ee1c08dd1e843c0225b772360e76'
         '4df25b623799b148a0703eaeec8fdf3f'
         '6d9939a2e667376031679ac9f9c49263')

_hgroot=https://bitbucket.org/goshawk
_hgrepo=gdc

_basedir="${srcdir}/gcc-${_gccver}"

build()
{
    cd ${_basedir}

    # rm -rf $srcdir/gcc-$_gccver $srcdir/gcc-build
    # mv $srcdir/gcc-$_gccver $srcdir/gcc-$_gccver-build
    rm -rf ${_basedir}/gcc/d
    ln -s $srcdir/gdc/d $srcdir/gcc-$_gccver/gcc

    # Don't install libiberty
    sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

    # Don't run fixincludes
    sed -i -e 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

    if [ "${CARCH}" = "x86_64" ]; then
        patch -Np1 -i ${srcdir}/gcc_pure64.patch
    fi
    patch -Np0 -i ${srcdir}/gcc-hash-style-both.patch

    # compatibility with latest cloog
    patch -Np1 -i ${srcdir}/gcc-4.6.2-cloog-0.17.patch

    ./gcc/d/setup-gcc.sh -v2

    echo ${_gccver} > gcc/BASE-VER

    cd ${srcdir}
    mkdir gcc-build && cd gcc-build

    ${_basedir}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bitbucket.org/goshawk/gdc/issues \
      --enable-languages=d,lto --disable-nls \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions \
      --disable-libstdcxx-pch --enable-libstdcxx-time \
      --enable-gnu-unique-object --enable-linker-build-id \
      --with-ppl --enable-cloog-backend=isl \
      --enable-lto --enable-gold --enable-ld=default \
      --enable-plugin --with-plugin-ld=ld.gold \
      --disable-multilib --disable-libssp \
      --disable-libgomp --disable-libmudflap \
      --enable-checking=release
    make
}

package()
{
   cd $srcdir/gcc-build

   # Easier to just do a full install and remove the excess later
   make -j1 DESTDIR=${pkgdir} install

   # Delete all the stuff we don't need
   rm -r $pkgdir/usr/lib/gcc/$CHOST/$_gccver/{*.a,*.so*,lto-wrapper,lto1,plugin*}
   rm -r $pkgdir/usr/lib/gcc/$CHOST/$_gccver/{crt*,cc1,collect2,include*,install*}
   rm -r $pkgdir/usr/share/{info,locale}
   rm $pkgdir/usr/lib/lib{quadmath,gomp,mudflap,gcc}*
   rm $pkgdir/usr/share/man/man1/{cpp,gc}*
   rm $pkgdir/usr/share/man/man7/{fsf,gfdl,gpl}*
   rm $pkgdir/usr/bin/{gcc,gcov,cpp,$CHOST-gcc,$CHOST-gcc-$_gccver}

   # Fix permissions
   chmod 644 $pkgdir/usr/lib/*
   chmod 755 $pkgdir/usr/lib/gcc
}
