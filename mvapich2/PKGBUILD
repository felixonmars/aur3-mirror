# Contributor: lishengming <lishengming.zju@gmail.com>
# Maintainer: Anthony Cornehl <accornehl[at]gmail[dot]com>
# https://github.com/twinshadow/abs
pkgname=mvapich2
pkgver=2.1rc1
pkgrel=2
pkgdesc="A MPI over InfiniBand, 10GigE/iWARP and RoCE"
url="http://mvapich.cse.ohio-state.edu/"
arch=('i686' 'x86_64')
license=("BSD")
depends=(
    'gcc-fortran'
    'libxml2'
    'libibumad'
    'libibmad'
    'libibverbs'
    'hwloc'
)
conflicts=('mpich2')
provides=('mpich2')
source=(
    "http://mvapich.cse.ohio-state.edu/download/mvapich/mv2/${pkgname}-${pkgver}.tar.gz"
    "mvapich2.profile"
)
md5sums=('9062fc3fa94f029cde5d53c57c0aefd6'
         '723bbf1aa54da5bab7aa09edfcae9116')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build

  # easy way, see more here:
  # http://mvapich.cse.ohio-state.edu/support/user_guide_mvapich2-1.8_alpha2.html
  ../configure \
      --prefix=/opt/mvapich2 \
      --enable-shared \
      --enable-sharedlibs=gcc \
      --with-ib-libpath=/usr/lib \
      --with-hwloc \
      --enable-g=all \
      --enable-error-messages=all
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make -j1 DESTDIR="${pkgdir}" install

  install -D -m755 "${srcdir}/${pkgname}.profile" "${pkgdir}/etc/profile.d/mvapich2.sh"
  mkdir -p "${pkgdir}/etc/ld.so.conf.d"
  echo "/opt/mvapich2/lib" > "${pkgdir}/etc/ld.so.conf.d/mvapich2.conf"

}
