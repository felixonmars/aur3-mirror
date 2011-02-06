# Maintainer: Michele <mickele>
# Contributor: Brice Méalier <mealier_brice____AT____yahoo____DOT____fr>
# Contributor: S1G1 <csi____AT____gmw____DOT____ch>
pkgname=metis-edf
pkgver=4.1
pkgrel=5
pkgdesc="METIS is a software package for partitioning unstructured graphs, partitioning meshes, and computing fill-reducing orderings of sparse matrices. This is not the original METIS, it has been specially patched by EDF to be used by Code_Aster."
url="http://www.code-aster.org/telechargement/tele_prod.php?prod=metis-edf&liste=all"
license="custom"
depends=()
makedepends=('make' 'gcc' 'patch' 'sed' 'coreutils' 'gcc-fortran')
provides=()
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
options=('docs')
source=(http://www.code-aster.org/V2/UPLOAD/DOC/Telechargement/aster-full-src-10.1.0-4.noarch.tar.gz metis_edf-4.1.diff LICENSE README)

_installdir=/opt/${pkgname}

build() {
  bsdtar -x -f aster-full-src-10.1.0/SRC/metis_edf-${pkgver}-2.noarch.tar.gz || return 1

  cd ${srcdir}/metis_edf-${pkgver} || return 1

  # Same FFLAGS as Code_Aster; only -fdefault-integer-8 should be necessary
  if [ "$CARCH" = "x86_64" ]; then
    export FFLAGS="-fdefault-double-8 -fdefault-integer-8 -fdefault-real-8 ${CFLAGS}"
  else # i686
    export FFLAGS="${CFLAGS}"
  fi

  # Changes to link to libgfotran
  sed -i "s|g77|gfortran|g" CONFIG/configure

  # Patch necessary to crate shared library
  patch -Np1 -i ${srcdir}/metis_edf-4.1.diff
  
  make || return 1

  cd Lib || return 1
  make ../libmetis.so || return 1
  cd .. || return 1
    
  # Install binaries and libraries
  install -m755 -d ${pkgdir}${_installdir}/bin/ || return 1
  install -m755 ${srcdir}/metis_edf-${pkgver}/{kmetis,pmetis,onmetis.exe}  ${pkgdir}${_installdir}/bin/ || return 1
  install -m755 -D onmetis ${pkgdir}${_installdir}/bin/onmetis || return 1
  install -m755 -D ${srcdir}/metis_edf-${pkgver}/libmetis.so  ${pkgdir}${_installdir}/lib/libmetis.so.${pkgver} || return 1
  ln -sf libmetis.so.${pkgver} ${pkgdir}${_installdir}/lib/libmetis.so.${pkgver:0:1} || return 1
  ln -sf libmetis.so.${pkgver} ${pkgdir}${_installdir}/lib/libmetis.so || return 1
  install -m644 ${srcdir}/metis_edf-${pkgver}/libmetis.a ${pkgdir}${_installdir}/lib/ || return 1
  install -m755 -d ${pkgdir}${_installdir}/include || return 1
  install -m644 ${srcdir}/metis_edf-${pkgver}/Lib/*.h  ${pkgdir}${_installdir}/include || return 1

  # Install doc and lincese
  install -m644 -D ${srcdir}/metis_edf-${pkgver}/Doc/manual.ps ${pkgdir}/usr/share/doc/${pkgname}/manual.ps || return 1
  install -m644 ${srcdir}/README ${pkgdir}/usr/share/doc/${pkgname}/manual.ps || return 1
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}
md5sums=('49fe55a0a46491124c16965a2db59c5e'
         'bf8b565cb517242eb1002a515b15ac8c'
         'a8f1258212bd36633a2a62c2af73b542'
         '69bc5f6fd8caf7eeade934caa88d3f47')
