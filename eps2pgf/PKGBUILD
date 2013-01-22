#
# Eps2pgf - Converts EPS figures to PGF/TikZ for inclusion in LaTeX
#
# maintainer i_magnific0 (i_magnific0@yahoo.com)

pkgname=eps2pgf
Pkgname=Eps2pgf # alternative spelling...
pkgver=0.7.0
pkgrel=4
pkgdesc="Converts EPS figures to PGF/TikZ for inclusion in LaTeX"
arch=('any')
url="http://${pkgname}.sourceforge.net/"
license=('GPL')
depends=('java-runtime' 'texlive-bin' 'texlive-pictures')
source=("http://downloads.sourceforge.net/project/${pkgname}/${Pkgname}/${Pkgname}%20${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('c0a23a58410f277ed4737900e701ea4d')
         
build() {
  cd $srcdir  
  jdir=${pkgdir}/usr/share/java/${pkgname}
  install -dm755 ${jdir}/lib
  install -dm755 ${jdir}/resources
  install -dm755 ${jdir}/resources/afm
  install -dm755 ${jdir}/resources/fontdescriptions
  install -dm755 ${jdir}/resources/texstrings

  install -Dm644 ${pkgname}.jar               ${jdir}/$pkgname.jar
  install -Dm644 lib/*.jar                    ${jdir}/lib/
  install -Dm644 resources/*.*                ${jdir}/resources/
  install -Dm644 resources/afm/*              ${jdir}/resources/afm/
  install -Dm644 resources/fontdescriptions/* ${jdir}/resources/fontdescriptions/
  install -Dm644 resources/texstrings/*       ${jdir}/resources/texstrings/

  install -Dm644 LICENSE.txt    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 NOTICE.txt     ${pkgdir}/usr/share/licenses/${pkgname}/NOTICE
  install -Dm644 README.txt     ${pkgdir}/usr/share/doc/${pkgname}/README

  # Executable.
  install -d $pkgdir/usr/bin
  echo "#!/bin/sh"					      > ${pkgdir}/usr/bin/${pkgname}
  echo CLASSPATH="/usr/share/java/${pkgname}/${pkgname}.jar" >> ${pkgdir}/usr/bin/${pkgname}
  echo java -jar \"\${CLASSPATH}\" \"\$@\"                   >> ${pkgdir}/usr/bin/${pkgname}
  chmod 755 $pkgdir/usr/bin/$pkgname
}