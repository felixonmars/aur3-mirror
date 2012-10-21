# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=cudpp
pkgver=2.0
pkgrel=2
pkgdesc="The CUDA Data Parallel Primitives Library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/cudpp"
license=('BSD')
depends=('cuda-toolkit')
source=(http://cudpp.googlecode.com/files/cudpp_src_2.0.zip)
sha1sums=(fb4e0d08f1a4888a9f73de7486c31e5e0d341d96)

build() {
  test -d $srcdir/build || mkdir $srcdir/build
  cd $srcdir/build
  cmake ../cudpp_src_2.0 \
    -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda-toolkit/
  # A workaround for errors on GCC 4.7.
  cat <<eof >> $srcdir/cudpp_src_2.0/include/cudpp_config.h
#undef _GLIBCXX_ATOMIC_BUILTINS
#undef _GLIBCXX_USE_INT128
eof
  make cudpp
}

package() {
  mkdir -p $pkgdir/usr/{lib,include} || return 1
  install -m 644 $srcdir/build/lib/libcudpp.a $pkgdir/usr/lib
  install -m 644 $srcdir/cudpp_src_2.0/include/cudpp{,_config}.h $pkgdir/usr/include
}
