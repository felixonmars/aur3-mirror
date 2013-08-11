# Contributor: Jerome Berger <jeberger@free.fr>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>

# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

pkgname=gdc
_gitname=gdc
pkgver=4.8.1
pkgrel=1
_snapshot=4.8-20130725
pkgdesc="GDC, The D Programming Language (D2) frontend for GCC. GIT branch compatible to [core] gcc's source code."
arch=('i686' 'x86_64')
url="https://github.com/D-Programming-GDC/GDC"
license=('GPL')
provides=('gdc')
depends=('perl' 'libmpc' 'cloog')
makedepends=('binutils>=2.23' 'git')
conflicts=('gdc1-bin' 'gdc1-hg' 'gdc-git')
options=('!libtool' '!emptydirs' '!buildflags')
source=(ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
        ${_gitname}::git://github.com/D-Programming-GDC/GDC.git#branch=gdc-4.8)
md5sums=('e21f259bc4c44e61e19a780ad5badfeb'
         'SKIP')
sha256sums=('e4e2202b15f8ba323f88c65de0e4190b0630a4b2e70b0653526b31e946877ead'
            'SKIP')

prepare()
{
  cd ${srcdir}/gcc-${_snapshot}

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries in /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  echo ${pkgver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  cd ${srcdir}/${_gitname}
  ./setup-gcc.sh ../gcc-${_snapshot}

  mkdir ${srcdir}/gcc-build
}

build()
{
  cd ${srcdir}/gcc-build

  #${srcdir}/gcc-${_snapshot}/configure --prefix=/usr \
  #    --libdir=/usr/lib --libexecdir=/usr/lib \
  #    --mandir=/usr/share/man --infodir=/usr/share/info \
  #    --with-bugurl=http://gdcproject.org/bugzilla/ \
  #    --enable-languages=d \
  #    --disable-multilib --disable-nls --disable-bootstrap \
  #    --disable-libgomp --disable-libmudflap --disable-libquadmath \
  #    --disable-shared
  ${srcdir}/gcc-${_snapshot}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=d \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-cloog-backend=isl --disable-cloog-version-check \
      --enable-lto --enable-gold --enable-ld=default \
      --enable-plugin --with-plugin-ld=ld.gold \
      --with-linker-hash-style=gnu --disable-install-libiberty \
      --disable-multilib --disable-libssp --disable-werror \
      --disable-nls --disable-bootstrap \
      --disable-libgomp --disable-libmudflap --disable-libquadmath
  make
}

package()
{
  cd ${srcdir}/gcc-build

  # Easier to just do a full install and remove the excess later
  make DESTDIR=${pkgdir} install

  # Delete all the stuff we don't need
  rm -rf ${pkgdir}/usr/include/c++*
  rm -rf ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/{*.a,*.so*,lto-wrapper,lto1,plugin*}
  rm -rf ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/{crt*,cc1,cc1plus,collect2,include*,install*}
  rm -rf ${pkgdir}/usr/share/info
  rm -rf ${pkgdir}/usr/lib/{libgcc*,libiberty*,libitm*,libstdc++*,libsupc++*,libasan*,libtsan*}
  rm -rf ${pkgdir}/usr/share/man/man1/{cpp,gc,g++}*
  rm -rf ${pkgdir}/usr/share/man/man7/{fsf,gfdl,gpl}*
  rm -rf ${pkgdir}/usr/bin/{gcc,gcov,cpp,${CHOST}-gcc,${CHOST}-gcc-${pkgver},c++,g++,${CHOST}-c++,${CHOST}-g++}
  rm -rf ${pkgdir}/usr/bin/{gcc-ar,gcc-nm,gcc-ranlib,${CHOST}-gcc-ar,${CHOST}-gcc-nm,${CHOST}-gcc-ranlib}
  rm -rf ${pkgdir}/usr/share/gcc-${pkgver}/python*

  # Fix permissions
  chmod 644 ${pkgdir}/usr/lib/*
  chmod 755 ${pkgdir}/usr/lib/gcc
}
