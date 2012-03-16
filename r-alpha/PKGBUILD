# $Id$
# Contributor: Florian Breitwieser <florian.bw@gmail.com>

pkgname=r-alpha
pkgver=20120314
_pkgver=2012-03-14_r58748
pkgrel=1
pkgdesc="Language and environment for statistical computing and graphics - alpha version"
arch=('i686' 'x86_64')
license=('GPL')
url=('http://www.r-project.org/')
depends=('blas' 'lapack' 'bzip2'  'libpng' 'libjpeg' 'libtiff'
         'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs'
         'tk' 'libxt' 'libxmu' 'pango' 'xz')
makedepends=('openjdk6' 'gcc-fortran')
backup=('etc/R/Makeconf' 'etc/R/Renviron' 'etc/R/ldpaths' 'etc/R/repositories')
options=('!makeflags')
source=("http://cran.r-project.org/src/base-prerelease/R-alpha_${_pkgver}.tar.gz"
	'r-alpha.desktop'
	'r-alpha.png')
install=r-alpha.install

build() {
   cd ${srcdir}/R-alpha
   sed -i 's|#define NeedFunctionPrototypes 0|#define NeedFunctionPrototypes 1|g' src/modules/X11/dataentry.c
   ./configure  --prefix=/opt/r-alpha \
		--enable-R-shlib \
                --with-lapack \
		--with-blas \
                F77=gfortran \
		LIBnn=lib
   make
}

package() {
   cd ${srcdir}/R-alpha
   make -j1 DESTDIR=${pkgdir} install

  # install some freedesktop.org compatibility
  install -Dm644 ${srcdir}/r-alpha.desktop ${pkgdir}/usr/share/applications/r-alpha.desktop
  install -Dm644 ${srcdir}/r-alpha.png ${pkgdir}/usr/share/pixmaps/r-alpha.png

  # move the config directory to /etc and create symlinks
  install -d ${pkgdir}/etc/R-alpha
  cd ${pkgdir}/opt/r-alpha/lib/R/etc
  for i in *; do
    mv -f ${i} ${pkgdir}/etc/R-alpha
    ln -s /etc/R-alpha/${i} ${i}
  done

  # links
  install -d ${pkgdir}/usr/bin
  ln -s /opt/r-alpha/bin/R ${pkgdir}/usr/bin/R-alpha
  ln -s /opt/r-alpha/bin/Rscript ${pkgdir}/usr/bin/Rscript-alpha
}

md5sums=('73757bd694b9718a9c38233ee49c9e00'
         '67566999d12891ae43455956838a8a8b'
         'f1dd6ee15f2951067c3d775779f1b323')
