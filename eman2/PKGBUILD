# Maintainer: anergy <anergy.25110321@gmail.com>
pkgname=eman2
pkgver=2.06
pkgrel=1
epoch=1
pkgdesc="scientific image processing tools aimed at the transmission electron microscopy"
arch=(x86_64 i686)
url="http://blake.bcm.edu/emanwiki/EMAN2"
license=('GPL')
groups=()
depends=(gsl freeglut libgl libjpeg qt libpng14 libtiff python2 python2-pyqt python2-opengl python2-matplotlib fftw
         db python2-bsddb 'ipython2<0.11' hdf5 boost)
makedepends=(cmake)
checkdepends=()
optdepends=()
provides=(sparx)
conflicts=()
replaces=()
backup=()
options=(strip makeflags)
source=(http://ncmi.bcm.edu/ncmi/software/counter_222/software_120/eman-source-$pkgver.tar.gz
        eman2.sh
        eman2.csh)
noextract=()
if [ `uname -m` = 'x86_64' ]; then
  enable_x86_64="ON"
else
  enable_x86_64="OFF"
fi

cmake_options=(
    -D ENABLE_X86_64=${enable_x86_64} 
    -D EMAN_INSTALL_PREFIX=/opt/eman2
    -D PYTHON_ROOT=/usr/lib/python2.7
    -D PNG_INCLUDE_PATH=`pkg-config --cflags-only-I libpng14|sed -e 's/-I//'`
    -D PNG_LIBRARY='/usr/lib/libpng14.so'
    )
build() {
  cd $srcdir
#  patch -p2 < ns-marchingcube.patch
#  patch -p2 < ns-sparxutil.patch
  cd "$srcdir/EMAN2/src/build"
  cmake ${cmake_options[@]} ../eman2 || return 1
  make -j4 || return 1
  cd $srcdir/EMAN2/src/eman2/
  find ./ -name '*.py' -exec sed -i "1s/python$/python2/" {} \;
  sed -i "1s/python$/python2/" sparx/bin/sparx
}

package() {
  cd "$srcdir/EMAN2/src/build"
  make DESTDIR=${pkgdir} install
  cd "$srcdir"
  install -d $pkgdir/etc/profile.d
  install eman2.sh $pkgdir/etc/profile.d
  install eman2.csh $pkgdir/etc/profile.d
}

# vim:set ts=2 sw=2 et:
sha256sums=('098a628268af0f29ca5d4eefbc8f11d925c8ea3b9f4c6be3f23c0094ba9f223e'
            '1900a15f6c59778ed6a56f0ecb4de3cb9bb350da44a316c36be635b0f8351f64'
            'bae77814c6c03599af0b6449af13a883dbde2c32f66ef17fc252d66243da590c')
