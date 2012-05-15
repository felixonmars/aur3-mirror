# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Maintainer: Eduardo Martins Lopes "duca" <edumlopes@gmail.com>
# Maintainer: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Ricardo <rikardo.horo@gmail.com>

pkgname=gromacs-407
_pkgdest=gromacs_407-mpi
_pkgver=407
_pkgname=gromacs
pkgver=4.0.7
pkgrel=3
pkgdesc='A fast Molecular Dynamics program based on the GROMOS force field'
url='http://www.gromacs.org/'
license=("GPL")
arch=('i686' 'x86_64')
depends=('fftw' 'lesstif' 'perl' 'libxml2' 'libsm' 'libx11')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/${_pkgname}-${pkgver}.tar.gz)
md5sums=('51369bd553e6bba4085a58bcf23d337d')

build() {
  mkdir -p ${srcdir}/{single,double}
  mkdir -p ${pkgdir}/usr/local/${_pkgdest}/
  mkdir -p ${pkgdir}/usr/{bin,share/man1}
  mkdir -p ${pkgdir}/etc/profile.d/

  cp -r ${srcdir}/${_pkgname}-${pkgver}/* ${srcdir}/single
  cp -r ${srcdir}/${_pkgname}-${pkgver}/* ${srcdir}/double 
  msg2 "Building the double precision files"
  cd ${srcdir}/double
  ./configure --prefix=/usr/local/${_pkgdest} --enable-double --enable-mpi --enable-shared --program-suffix=_${_pkgver}_mpi_d  --bindir=/usr/bin/ --mandir=/usr/share/man1
  make 
  msg2 "Building the single precision files"
  cd ${srcdir}/single
  ./configure --prefix=/usr/local/${_pkgdest} --disable-double --enable-mpi --enable-shared --enable-float --program-suffix=_${_pkgver}_mpi --bindir=/usr/bin --mandir=/usr/share/man1
   make
}

package() {
  #cd "${srcdir}/${pkgname}-${pkgver}"
  msg2 "Making the single precision executables"
  cd ${srcdir}/single
  make DESTDIR=${pkgdir} install

# installing completions in correct location
  install -D scripts/completion.bash "${pkgdir}/etc/bash_completion.d/${_pkgdest}"

# Cleaning up, kept the csh completion at default location
  msg2 "Making the double precision executables"
  cd ${srcdir}/double
  make DESTDIR=${pkgdir} install

# installing completions in correct location
  install -D -m755 ${pkgdir}/usr/bin/completion.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgdest}"
  mv ${pkgdir}/usr/bin/GMXRC.bash ${pkgdir}/etc/profile.d/GMXRC_${_pkgver}.bash
  mv ${pkgdir}/usr/bin/GMXRC.csh ${pkgdir}/etc/profile.d/GMXRC_${_pkgver}.csh
  mv ${pkgdir}/usr/bin/GMXRC.zsh ${pkgdir}/etc/profile.d/GMXRC_${_pkgver}.zsh
  sed "s:/usr/bin/:/etc/profile.d:" ${pkgdir}/usr/bin/GMXRC > ${srcdir}/GMXRC.part
  sed "s:GMXRC:GMXRC_${_pkgver}:" ${srcdir}/GMXRC.part > ${pkgdir}/etc/profile.d/GMXRC_${_pkgver}
  echo "GMXLIB=$GMXDATA/top" >> ${pkgdir}/etc/profile.d/GMXRC_${_pkgver}.bash
  chmod 755 ${pkgdir}/etc/profile.d/GMXRC_${_pkgver}
  rm -f ${pkgdir}/usr/bin/completion.*
  rm -f ${pkgdir}/usr/bin/GMXRC
  

}
