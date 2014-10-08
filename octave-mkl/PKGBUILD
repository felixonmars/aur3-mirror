# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: shining <shiningxc.at.gmail.com>
# Contributor: cyberdune <cyberdune@gmail.com>
# Patches taken from the Debian packaging project and bug trackers

pkgname=octave-mkl
pkgver=3.8.2
pkgrel=1
pkgdesc="A high-level language, primarily intended for numerical computations. BLAS, LAPACK and FFT from Intel's MKL."
arch=('i686' 'x86_64')
url="http://www.octave.org"
license=('GPL')
provides=('octave=3.8.1')
conflicts=('octave')
depends=('intel-mkl' 'fftw' 'curl' 'graphicsmagick' 'glpk' 'hdf5' 'qhull' 'qrupdate' 'fltk' 'arpack' 'glu' 'gl2ps' 'suitesparse')
makedepends=('llvm>=3.4' 'java-environment' 'gcc-fortran' 'texlive-core' 'texinfo' 'gnuplot' 'qscintilla')
optdepends=('texinfo: for help-support in octave'
            'gnuplot: alternative plotting'
            'llvm: to allow use of the JIT'
            'qscintilla: required for the GUI'
            'java-environment: to be able to use Octave`s java interface')
options=('!emptydirs')
install=octave-mkl.install

source=(ftp://ftp.gnu.org/gnu/octave/octave-${pkgver}.tar.bz2
        'add_info_dir_categories.patch'
        'llvm-3_4.patch'
        'octave-suitesparse.patch')
md5sums=('188bd97e22054f9c62701ee0e6800dc1'
         'cbde759a77465ae874789df3b602e08f'
         '73106af74218ff81586cea26ccf8901b'
         'f56f76570de1962b0b0a05ebdecadff6')
sha512sums=('c2bf4cc844a5b8dbabf2b54d2458ee7573f87dc92ca8cd7829e8c057591387b3a0995b5b48c6e50ff2944411f2b28521de26e438ed431f68ab5b49b8ce1d94cc'
            '6f6831268a59e05cd407b4e2e1e0f78d4aee91fe2e49d42427bfe976fd4168434e97901e986785393c0d0f8e977e24061397d9b7e8cb15d059aa07c718dfaf82'
            'cf2a17cdcaa909376bafdc71317f43fd6cd42f98141590154761115b9038306e5bb6a11f607cd9afc35c2359fff10cc5cf9df607b50333e2c34680ee77c832d9'
            '3fd8c3d5135552c4e319718af0ae9838536446b8ed6d37493a78aa4b5935926a23c44574d2fa38773c56a6ced17c88e7965fde147cf27e30b0f9ead19cc9b53f')

if [ "$CARCH" == "x86_64" ]; then
    _intel_arch=intel64
    _intel_lib=mkl_gf_lp64
elif [ "$CARCH" == "i686" ]; then
    _intel_arch=ia32
    _intel_lib=mkl_gf
fi
_orgpkgname=octave

prepare() {
  # Apply selected patches, conveniently provided by Debian thanks to their diligent packagers
  # Refer to the patch files for details
  cd "${srcdir}/${_orgpkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/add_info_dir_categories.patch"
  patch -Np1 -i "${srcdir}/llvm-3_4.patch"
  patch -Np1 -i "${srcdir}/octave-suitesparse.patch"
  autoreconf -vfi
}

build() {
  # Set environment for building octave with Intel MKL
  source /opt/intel/mkl/bin/mklvars.sh ${_intel_arch}
  _mkllibs=" -fopenmp -Wl,--no-as-needed -I${MKLROOT}/include -I${MKLROOT}/include/fftw -L${MKLROOT}/lib/intel64 -l${_intel_lib} -lmkl_core -lmkl_gnu_thread -ldl -lpthread -lm"
  export LANG=C

  cd "${srcdir}/${_orgpkgname}-${pkgver}"

  ./configure  MOC=moc-qt4 UIC=uic-qt4 \
  --prefix=/usr --libexecdir=/usr/lib \
  --enable-shared --disable-static \
  --with-quantum-depth=16 \
  --enable-jit \
  --with-blas="${_mkllibs}" \
  --with-lapack="${_mkllibs}" \
  --with-fftw3="${_mkllibs}" \
  --with-fftw3f="${_mkllibs}"
#  --with-umfpack="-lumfpack -lsuitesparseconfig" \

  # Put Intel's basic math library in front of the GLIBC libm
  find ./ -name Makefile -exec sed -i "s/\(^\| \)-lm\( \|$\)/\1-limf -lm\2/g" {} \;

  LANG=C make
}

check() {
  cd "${srcdir}/${_orgpkgname}-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/${_orgpkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # add octave library path to ld.so.conf.d
  install -d "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_orgpkgname}/${pkgver}" > "${pkgdir}/etc/ld.so.conf.d/${_orgpkgname}.conf"
}
