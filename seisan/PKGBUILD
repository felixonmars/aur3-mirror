# Maintainer: Gaute Hope <eg@gaute.vetsj.com>

pkgname=seisan
pkgver=10.1
pkgrel=2
pkgdesc="SEISAN Earthquake analysis software package"
arch=('x86_64')
url="http://seisan.info/"
license=('custom')
makedepends=('gcc-fortran' 'gcc')
depends=('libmseed')
source=("ftp://ftp.geo.uib.no/pub/seismo/SOFTWARE/SEISAN/seisan_v${pkgver}_linux_64bit.tar.gz"
        "ftp://ftp.geo.uib.no/pub/seismo/SOFTWARE/SEISAN/seisan_test_data.tar.gz"
        )

noextract=("seisan_test_data.tar.gz")

build() {
  cd ${srcdir}

  # Rebuilding.. (for x86_64, might work for i386 as well)
  export SEISARCH=linux64
  export OUTPATH=${SEISARCH}

  cd LIB/
  make clean

  cd ../PRO/

  # update install path
  sed -i -e "s|/uibsan/home/s2000/seismo/pro|${pkgdir}/opt/seisan/PRO|" Makefile

  make clean
  make all

  # Regenerate IASP91 model
  msg "Regenerating IASP91 model.."
  cd ../WOR/
  ../PRO/remodl > /dev/null 2>&1
  ../PRO/setbrn > /dev/null 2>&1
  mv IASP* ../DAT/
  rm remodl*
  rm setbrn*

  cd ../

  # Increase MULPLT default resolution (screen & hard copy)
  msg "Increasing MULPLT default resolution to 60000 points (screen and h/c).."
  sed -i -e 's|points pl. screen  1500.0|points pl. screen  60000|' DAT/MULPLT.DEF
  sed -i -e 's|points pl. hc      3000.0|points pl. hc      60000|' DAT/MULPLT.DEF

  # Update seisan home path
  msg "Update SEISAN home path to /opt/seisan.."
  sed -i -e 's|/home/seismo|/opt/seisan|' COM/SEISAN.bash
  sed -i -e 's|/home/s2000/seismo|/opt/seisan|' COM/SEISAN.csh

  msg "Use vim as default editor.."
  sed -i -e 's|"vi"|"vim"|' COM/SEISAN.bash
  sed -i -e 's|EDITOR vi|EDITOR vim|' COM/SEISAN.csh

  msg "Convert windows line endings to unix line endings in SEISAN.*sh .."
  sed -i 's/\r//g' COM/SEISAN.bash
  sed -i 's/\r//g' COM/SEISAN.csh

  # Change default filters in MULPLT
  #echo "==> Warning: Changing default filters in MULPLT.."
  #sed -i -e 's|FILTER 1(.*)|FILTER 1                                8.0       25.0 |' DAT/MULPLT.DEF
  #sed -i -e 's|FILTER 2(.*)|FILTER 2                                20.0      50.0 |' DAT/MULPLT.DEF

}

package () {
  mkdir -p ${pkgdir}/opt/seisan
  mkdir ${pkgdir}/opt/seisan/{LIB,PRO}

  export SEISARCH=linux64
  export OUTPATH=${SEISARCH}

  cd "${srcdir}/PRO"
  make install

  #cp -r "${srcdir}/PRO/${SEISARCH}"/* ${pkgdir}/opt/seisan/PRO/
  cp -r "${srcdir}/LIB/"*.a "${pkgdir}/opt/seisan/LIB/"

  # copy pre-compiled msrepack and friends
  cp "${srcdir}/PRO/gmtxy" "${pkgdir}/opt/seisan/PRO/"

  cp -r ${srcdir}/{CAL,COM,DAT,INC,INF,ISO,PIC,REA,SUP,TMP,WAV,WOR} ${pkgdir}/opt/seisan

  # Install training data
  cp "${srcdir}/seisan_test_data.tar.gz" "${pkgdir}/opt/seisan/INF/"
  msg "Test data is located in /opt/seisan/INF."

  # Add seisan dirs to PATH
  mkdir -p ${pkgdir}/etc/profile.d
  echo "export PATH=\$PATH:/opt/seisan/PRO" > ${pkgdir}/etc/profile.d/seisan.sh
  echo "source /opt/seisan/COM/SEISAN.bash" >> ${pkgdir}/etc/profile.d/seisan.sh
  chmod +x ${pkgdir}/etc/profile.d/seisan.sh
}

md5sums=('42bbaa3dcd787f64c49a72819b91c364'
         '17a83cb87732ced23f066712773be29d')

