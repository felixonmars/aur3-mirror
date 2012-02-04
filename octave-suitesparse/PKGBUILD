# Maintainer : Marco Maso <demind@gmail.com>

pkgname=octave-suitesparse
pkgver=3.4.3
pkgrel=1
pkgdesc="A high-level language, primarily intended for numerical computations. Complete build against SuiteSparse"
arch=('i686' 'x86_64')
url="http://www.octave.org"
license=('GPL')
depends=('gcc-libs>=4.3.0' 'readline' 'fftw' 'zlib' 'pcre' 'curl'
'gperf' 'qhull' 'glpk' 'hdf5' 'gnuplot' 'suitesparse>=3.6.1' 'fltk' 'ftgl' 'graphicsmagick' 'arpack' 'qrupdate')
makedepends=('texinfo')
optdepends=('texinfo: for help-support in octave'
'gnuplot: to be able to plot in octave')
provides=('octave=3.4.3' 'octave3')
conflicts=('octave-devel' 'octave3' 'octave')
source=("ftp://ftp.gnu.org/gnu/octave/octave-$pkgver.tar.bz2")
md5sums=('185b08f4e4a7b646d76e4d33b77fa87e')
install=octave.install
options=('!emptydirs' 'docs')

build() {
cd "$srcdir/octave-$pkgver"

./configure --prefix=/usr --libexecdir=/usr/lib --with-lapack=/usr/lib --enable-shared --disable-static \
--with-{qrupdate,amd,camd,colamd,ccolamd,cholmod,cxsparse,umfpack}-libdir=/usr/lib \
--with-{qrupdate,amd,camd,colamd,ccolamd,cholmod,cxsparse,umfpack}-includedir=/usr/include

make
}

package() {
cd "$srcdir/octave-$pkgver"
make DESTDIR="$pkgdir" install

# install icon in the correct place
install -D -m644 doc/icons/octave-sombrero.png \
$pkgdir/usr/share/pixmaps/octave.png
# install info files
install -D -m644 doc/interpreter/octave.info* $pkgdir/usr/share/info
# fix desktop file
cd $pkgdir/usr/share/applications/
mv www.octave.org-octave.desktop octave.desktop
sed -i "s#/usr/bin/##" octave.desktop
sed -i "s#^Icon=.*#Icon=octave.png#" octave.desktop

cd $pkgdir/usr/share/info
rm -f dir
gzip *

}
