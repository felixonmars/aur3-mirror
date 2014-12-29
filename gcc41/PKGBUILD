pkgname=gcc41
pkgver=4.1.2
pkgrel=3
_islver=0.12.2
_cloogver=0.18.1
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL')
depends=('glibc>=2.17' 'binutils>=2.24' 'libmpc')
makedepends=('binutils>=2.24' 'libmpc' 'elfutils' 'dejagnu' 'glibc>=2.11.1-2')
options=('!libtool' '!emptydirs' '!buildflags' 'staticlibs')
source=("http://mirrors.ustc.edu.cn/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz
        )
md5sums=('a4a3eb15c96030906d8494959eeda23c'
         'e039bfcfb6c2ab039b8ee69bf883e824'
         'e34fca0540d840e5d0f6427e98c92252')
prepare() {
cd "$srcdir/gcc-$pkgver"

# May be necessary but it works for me without this locale
#if ! locale -a | grep ^de_DE; then
#  echo "You need the de_DE locale to build gcc."
#  return 1
#fi

# Don't install libiberty
sed -i 's|install_to_$(INSTALL_DEST) ||' libiberty/Makefile.in

# Don't run fixincludes
sed -i -e 's|\./fixinc\.sh|-c true|' gcc/Makefile.in

# fix siginfo
sed -i 's/struct siginfo/siginfo_t/g'  gcc/config/i386/linux-unwind.h

# Disables generating documentation (new texinfo does not like the old .texi files)
echo "MAKEINFO = :" >> ${srcdir}/gcc-${pkgver}/Makefile.in

if [ ! -d build ]; then
mkdir build
fi
}

build() {
cd "$srcdir/gcc-$pkgver"/build

  ../configure --prefix=/usr --libdir=/usr/lib --libexecdir=/usr/lib \
  --mandir=/usr/share/man --infodir=/usr/share/info \
  --enable-shared --disable-nls --disable-multilib \
  --enable-languages=c,c++,fortran,objc,obj-c++ --enable-threads=posix \
  --enable-__cxa_atexit --enable-clocale=gnu --disable-libstdcxx-pch \
  --program-suffix="-4.1" --enable-version-specific-runtime-libs
make
}

package() {
cd "$srcdir/gcc-$pkgver/build"
make -j1 DESTDIR="$pkgdir/" install
_gccbasedir=${pkgdir}/usr/lib/gcc/x86_64-unknown-linux-gnu
[[ $CARCH == "x86_64" ]] && \
mv ${_gccbasedir}/lib64/* ${_gccbasedir}/${pkgver}/ && \
rmdir ${_gccbasedir}/lib64
rm $pkgdir/usr/include/mf-runtime.h
rm -r $pkgdir/usr/share
}

# vim:set ts=2 sw=2 et:
