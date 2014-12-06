# Maintainer: zezadas   jmrm@ua.pt    https://www.github.com/zezadas
pkgname=cartao-cidadao-svn
pkgver=1.0
pkgrel=0
pkgdesc="Cartao de Cidadaozadas"
depends=('qtchooser' 'svn' 'qt4' 'pcsclite>=1.5.0' 'jasper' 'openssl' 'ccid' 'openssl098'  'libpng12' 'acsccid>=1.0.3' 'xerces-c')
arch=('any')
url="https://svn.gov.pt/projects/ccidadao"
license=('GPL')
source=(svn+https://svn.gov.pt/projects/ccidadao/repository/middleware-offline/trunk/_src/)
md5sums=('SKIP')
conflicts=('cartao-cidadao')


build() {


  cd "${pkgsrc}"
  #svn co https://svn.gov.pt/projects/ccidadao/repository/middleware-offline/trunk/_src/
  cd "${srcdir}/_src/eidmw/"
  chmod +x ./configure
  #some error with static libs and .rodata solved
  unset CPPFLAGS
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS 
  #compile with qt4
  export QT_SELECT=4
  export QTDIR=/usr/share/qt4
  export QMAKESPEC=/usr/share/qt4/mkspecs/linux-g++
  export QT_LIBRARY_PATH=/usr/include/Qt

 #dunno what I'm doing.
 #soo ashamed of this sed :()
 #dunno why it keeps copying files to /usr/local
 grep -ir usr\/local | cut -d ':' -f 1 | uniq | grep -v secmod.db  > replaces
  FILE=replaces

  while read CMD; do
    sed -i 's/usr\/local/usr/g'   "$CMD"
  done < "$FILE"
  
  ./configure --prefix=/usr   
  make
}



package() {
  cd "${srcdir}/_src/eidmw/"
  make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
  cd "${srcdir}/_src/eDT"
  mkdir -p "$pkgdir/usr/include/"
  cp -r "DiagLib" "$pkgdir/usr/include/pteid"
  #cp -r "${pkgsrc}/_src/eDT/DiagLib" "${srcdir}/usr/include/pte"
  
}
