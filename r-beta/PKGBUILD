# $Id$
# Contributor: Florian Breitwieser <florian.bw@gmail.com>

pkgname=r-beta
pkgver=20120317
_pkgver=2012-03-17_r58785
pkgrel=1
pkgdesc="Language and environment for statistical computing and graphics - beta version"
arch=('i686' 'x86_64')
license=('GPL')
url=('http://www.r-project.org/')
depends=('blas' 'lapack' 'bzip2'  'libpng' 'libjpeg' 'libtiff'
         'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs'
         'tk' 'libxt' 'libxmu' 'pango' 'xz')
makedepends=('openjdk6' 'gcc-fortran')
backup=('etc/R/Makeconf' 'etc/R/Renviron' 'etc/R/ldpaths' 'etc/R/repositories')
options=('!makeflags')
source=("http://cran.r-project.org/src/base-prerelease/R-beta_${_pkgver}.tar.gz"
    'r-beta.desktop'
	'r-beta.png')
install=r-beta.install

build() {
   cd ${srcdir}/R-beta
   sed -i 's|#define NeedFunctionPrototypes 0|#define NeedFunctionPrototypes 1|g' src/modules/X11/dataentry.c
   ./configure  --prefix=/opt/r-beta \
		--enable-R-shlib \
                --with-lapack \
		--with-blas \
                F77=gfortran \
		LIBnn=lib
   make
}

package() {
   cd ${srcdir}/R-beta
   make -j1 DESTDIR=${pkgdir} install

  # install some freedesktop.org compatibility
  install -Dm644 ${srcdir}/r-beta.desktop ${pkgdir}/usr/share/applications/r-beta.desktop
  install -Dm644 ${srcdir}/r-beta.png ${pkgdir}/usr/share/pixmaps/r-beta.png

  # move the config directory to /etc and create symlinks
  install -d ${pkgdir}/etc/R-beta
  cd ${pkgdir}/opt/r-beta/lib/R/etc
  for i in *; do
    mv -f ${i} ${pkgdir}/etc/R-beta
    ln -s /etc/R-beta/${i} ${i}
  done

  # links
  install -d ${pkgdir}/usr/bin
  ln -s /opt/r-beta/bin/R ${pkgdir}/usr/bin/R-beta
  ln -s /opt/r-beta/bin/Rscript ${pkgdir}/usr/bin/Rscript-beta
}
md5sums=('ec4a25f8a0565e008cd76ed20df09556'
         'd1b074c69b497d56056e8a81db0a8eae'
         'c2b4c9f9557e39322304b868c219fce1')
