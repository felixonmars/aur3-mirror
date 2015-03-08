# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>

# You MUST manually download acml-${pkgver}-gfortran-64bit.tgz from here: http://developer.amd.com/tools-and-sdks/cpu-development/amd-core-math-library-acml/acml-downloads-resources/
# I recommend downloading it to the directory specified by SRCDEST in /etc/makepkg.conf
pkgname=acml-gfortran
pkgver=6.1.0.31
pkgrel=1
pkgdesc="AMD Core Math Library (ACML) for Linux built with GFORTRAN"
arch=("x86_64")
url="http://developer.amd.com"
license=(custom)
depends=("gcc-libs" "gcc-fortran" "bash" "tcsh" "libcl")
options=('staticlibs')
source=('http://localhost/acml-6.1.0.31-gfortran64.tgz' 'ACML-EULA.txt')
sha512sums=('6080088f430c2830ad8a0d418823c1fba3d8eef4d921621816a2790ee9f5596f01b2d998bc1c756e02cdd5252d7064e7251e131498fe150ee945c8580bb5c47b'
            'ea78d7ac056732bf23bd597d4765b2bde7c05f2aa91ce2d69d6f7dad7518c40b4672857d05bea56df6268741916453baee758f8b985481affe9a4a89f07f32a9')

# You MUST manually download acml-6.1.0.31-gfortran64.tgz from:
# http://developer.amd.com/tools-and-sdks/cpu-development/amd-core-math-library-acml/acml-downloads-resources
# Once downloaded, copy or move the TGZ file to the directory where the PKGBUILD is stored (usually /tmp/yaourt-tmp-root/acml-gfortran)

prepare() {
  
  cd $srcdir
  echo
  echo -e "   \033[1mATTENTION: You MUST accept the LICENSE AGREEMENT!\033[0m"
  echo "   The sources of ACML cannot be redistributed by Arch Linux or anyone else."
  echo "   If you decide to install this package, then you must first read and agree to the various licences which apply."
  echo
  echo -e "   Press \033[1menter\033[0m to display the LICENSE AGREEMENT. When you have finished reading, hit \033[1mq\033[0m to return here."
  echo
  read
  echo
  cat $srcdir/ACML-EULA.txt | less 
  echo -e "   By passing through this step, you agree to abide by the terms and conditions set forth in the end-user license agreement."
  echo -e "   If you do not agree to abide by these terms and conditions, \033[1myou are not permitted to use this pacakge\033[0m."
  echo -e "   In the case you are not entitled, please press \033[1mn\033[0m now. Otherwise, press \033[1my\033[0m to begin the installation.  [y/n]"
  echo
  read answer

  while test -z "$answer"; do
    echo -e "   You must answer \033[1my\033[0m or \033[1mn\033[0m."
    echo "   Do you assert that this is true? [y/n]"
    read answer
  done

  if [ $answer != "y" ] && [ $answer != "Y" ]; then
    echo -e "   You did not answer \033[1myes\033[0m, therefore installation will abort!"
    return 1
  fi

  echo "   You have accepted the license agreement. Installation continuing..."
}

#build() {	

 # cd ${srcdir}/gfortran64/examples
 # make
 # cd ${srcdir}/gfortran64_mp/examples
 # make

#}
package(){

  mkdir -p $pkgdir/usr/share/licenses/acml-gfortran
  mkdir -p $pkgdir/usr/include/acml/gfortran
  mkdir -p $pkgdir/usr/lib/acml/gfortran
  mkdir -p $pkgdir/opt/acml/gfortran

  cp ${srcdir}/gfortran64/include/* ${pkgdir}/usr/include/acml/gfortran/
  cp -r ${srcdir}/gfortran64/lib/* ${pkgdir}/usr/lib/acml/gfortran/
  cp -r ${srcdir}/gfortran64_mp/lib/* ${pkgdir}/usr/lib/acml/gfortran/

#  cp -r ${srcdir}/gfortran64/examples ${pkgdir}/opt/acml/gfortran/examples
#  cp -r ${srcdir}/gfortran64_mp/examples ${pkgdir}/opt/acml/gfortran/examples_mp

  cp -r ${srcdir}/Doc ${pkgdir}/opt/acml/gfortran/
  cp -r ${srcdir}/util ${pkgdir}/opt/acml/gfortran/
  cp ${srcdir}/ReleaseNotes ${pkgdir}/opt/acml/gfortran/
  install -D -m644 ${srcdir}/ACML-EULA.txt ${pkgdir}/usr/share/licenses/acml-gfortran/LICENSE
  find "$pkgdir/opt/acml/" -type f -exec chmod 644 {} \;
  find "$pkgdir/opt/acml/" -type d -exec chmod 755 {} \;
  chown -R root:root "$pkgdir"

}
