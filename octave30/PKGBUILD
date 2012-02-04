# $Id$
# Maintainer: Yngve Inntjore Levinsen <yngve.levinsen@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor : shining <shiningxc.at.gmail.com>
# Contributor : cyberdune <cyberdune@gmail.com>

pkgname=octave30
pkgver=3.0.5
pkgrel=1
pkgdesc="A high-level language, primarily intended for numerical computations. 3.0 version"
arch=('i686' 'x86_64')
url="http://www.octave.org"
license=('GPL')
depends=('fftw' 'pcre' 'curl' 'lapack' 'libx11' 'graphicsmagick' 'glpk' 'hdf5' 'gcc-libs' 'qhull')
makedepends=('texinfo' 'graphicsmagick' 'gcc-fortran' 'umfpack' 'texlive-core' 'fltk')
optdepends=('texinfo: for help-support in octave'
            'gnuplot: alternative plotting'
	    'umfpack: LU decomposition of some large sparse matrices'
	    'fltk: alternative plotting')
source=("ftp://ftp.gnu.org/gnu/octave/octave-$pkgver.tar.bz2"
        "octave305-gcc46.patch")
options=('!emptydirs')
install=octave.install
sha1sums=('56a83139575caeda647ab8a0d306a276bb0473f3'
      '6a65e914de994979909a33c192c295b6cd6176de')

build() {
  cd ${srcdir}/octave-${pkgver}
echo "patching.."
  patch -p1 -i ../octave305-gcc46.patch  
echo "finished patching.."

  # http://www.nabble.com/Random-rounding-errors-td16010966.html
  FFLAGS="-O -ffloat-store" 
  CXXFLAGS="-fpermissive" 
  CFLAGS="-fpermissive" 

  ./configure --prefix=/opt/ --libexecdir=/opt/lib \
       --enable-shared --without-hdf5 --disable-static --with-quantum-depth=16

  LANG=C make
}

package(){
  cd ${srcdir}/octave-${pkgver}

  make DESTDIR="${pkgdir}" install

  # add octave library path to ld.so.conf.d
  install -d ${pkgdir}/etc/ld.so.conf.d
  echo "/usr/lib/octave-${pkgver}" > ${pkgdir}/etc/ld.so.conf.d/octave.conf
}
