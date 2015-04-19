# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: K. Piche <kpiche@rogers.com>

_pkgname=r
pkgname=librmath
pkgver=3.2.0
pkgrel=1
pkgdesc="Standalone lib from R"
arch=('i686' 'x86_64')
license=('GPL')
url=('http://www.r-project.org/')
#depends=('blas' 'lapack' 'bzip2'  'libpng' 'libjpeg' 'libtiff'
#         'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs'
#         'libxt' 'libxmu' 'pango' 'xz' 'desktop-file-utils')
makedepends=('gcc-fortran')
conflicts=('r')
source=("http://cran.r-project.org/src/base/R-3/R-${pkgver}.tar.gz"
	'R.conf')
sha1sums=('a6e9a6ca5ef186037a2f8ad2ccc8d7d0147640f1'
          '43668da6cfd1b4455a99f23e79e2059294dddac9')


build() {
  cd "${srcdir}/R-${pkgver}"

  ./configure  --prefix=/usr \
	--libdir=/usr/lib \
	--with-x=no

  # make libRmath.so
  cd src/nmath/standalone
  make shared
}

package() {
  cd "${srcdir}/R-${pkgver}"

  # install libRmath.so
  cd src/nmath/standalone
  make DESTDIR="${pkgdir}" install

  # Install ld.so.conf.d file to ensure other applications access the shared lib
  install -Dm644 "${srcdir}/R.conf" "${pkgdir}/etc/ld.so.conf.d/R.conf"
}
