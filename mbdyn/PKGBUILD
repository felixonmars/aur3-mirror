# Author: David Verelst <david.verelst at gmail dotcom>

pkgname=mbdyn
pkgver=1.5.6
pkgrel=1
pkgdesc="Free and general purpose Multibody Dynamics analysis software"
arch=('any')
url="http://www.mbdyn.org/"
license=(GPL)
depends=('python2' 'python2-numpy' 'libatomic_ops' 'swig' 'octave' 'blas'
         'lapack' 'suitesparse<=4.2.1' 'boost' 'ginac' 'libltdl')
#      'libltdl: support for loading external modules at run-time'
#      'ginac: symbolic manipulation support'
#      'suitesparse<=4.2.1: for umfpack additional sparse matrix solver'
#      'lapack' 
#      'superlu: linear algebra solver'
#      'mpich: parallel implementation'
#      'metis: domain partitioning for parallel solver'
#      'swig: for Python bindings'
#      'python2: for Python bindings' 
#      'python2-numpy: for Python bindings'
#      'octave: for Octave bindings' 
#      'libatomic_ops: for multi-threaded support'
makedepends=('texlive-core' 'latex2html') # required for build LaTeX manual
optdepends=()
source=("https://www.mbdyn.org/userfiles/downloads/$pkgname-$pkgver.tar.gz"
        "https://www.mbdyn.org/userfiles/downloads/mbdyn-1.5.6-module-octave-build.1.patch"
        "https://www.mbdyn.org/userfiles/documents/$pkgname-input-$pkgver.pdf"
        "https://www.mbdyn.org/userfiles/documents/technical.pdf")
md5sums=('c1f7d613313ba6d3707bb77eae77c1ad'
         '15ea1993d27743df053182da98a6c7ea'
         'a634161c826d87eb79a7bc419ac1aa65'
         '5425fef66952ab53c5af8b244da40376')

# MAKE SURE TO BUILD IN CLEAN DIRECTORY

build() { 
  cd "$srcdir/$pkgname-$pkgver/"
  # replace python with python2 when testing for NumPy libraries
#  sed -i 's/python -c/python2 -c/g' "$srcdir/$pkgname-$pkgver/configure.in"
  sed -i 's/python -c/$PYTHON -c/g' "$srcdir/$pkgname-$pkgver/configure"
  
  # apply octave patch
  patch -Np0 -i ../mbdyn-1.5.6-module-octave-build.1.patch
  
  export PYTHON_VERSION="2.7"
  ./configure --enable-python \
              --enable-multithread \
              --enable-octave \
              --prefix="$pkgdir/opt/mbdyn" \
              --enable-eig \
              --enable-autodiff \
              --enable-runtime-loading \
              --with-blas=blas \
              --with-ginac \
              --with-lapack \
              --with-boost \
              --with-threads
#              --with-superlu \
#              --with-umfpack
#              --with-bullet \
#              --prefix="$pkgdir/usr/local"
  make
  
  # create pth file to add the python module to PYTHONPATH
  cd "$srcdir/$pkgname-$pkgver/"
  echo "/opt/mbdyn/libexec/mbpy" >> "mbpy.pth"
  
  # create the manual
  cd "$srcdir/$pkgname-$pkgver/manual/install" 
  latex install.tex
  dvipdfm install.dvi
  
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make install
  
  # add mbdyn to the PYTHONPATH
  install -Dm644 "mbpy.pth" "$pkgdir/usr/lib/python2.7/site-packages/mbpy.pth"
  
  # the documentatoin
  install -Dm644 "manual/install/install.pdf" "$pkgdir/opt/mbdyn/$pkgname-installation-manual-$pkgver.pdf"
  cd "$srcdir"
  install -Dm644 "$pkgname-input-$pkgver.pdf" "$pkgdir/opt/mbdyn/$pkgname-input-$pkgver.pdf"
  install -Dm644 "technical.pdf" "$pkgdir/opt/mbdyn/technical.pdf"
}

# vim:set ts=2 sw=2 et:
