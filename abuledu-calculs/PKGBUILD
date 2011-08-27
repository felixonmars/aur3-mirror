# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-calculs
pkgver=8.4
pkgrel=1
pkgdesc="Calcul practicing from Leterrier (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/leterrier/pool/main/a/abuledu-calculs/abuledu-calculs_8.4-2-3ryxeo1.tar.gz')
md5sums=('048599fb125afe7e733296a2e2463c39')
install=abuledu-calculs.install

build() {
  cd ${startdir}/src/$pkgname-$pkgver-2
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-calculs}
  sed -i 's_abuledu-calculs.png_/usr/share/pixmaps/abuledu-calculs.png_' abuledu-calculs.desktop
  cp -a abuledu-calculs.desktop ${startdir}/pkg/usr/share/applications/abuledu-calculs.desktop
  bzip2 -dc mandrake/abuledu-calculs-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-calculs.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-calculs
  find ${startdir}/pkg/usr/share/abuledu-calculs -name \*\.tcl -exec recode ibmpc..lat1 {} \;
  rm -f ${startdir}/pkg/usr/share/abuledu-calculs/runbrowser
  rm -rf `find ${startdir}/pkg/usr/share/abuledu-calculs -type d -name CVS`
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-calculs
  cp -a aide/* ${startdir}/pkg/usr/share/doc/abuledu-calculs
  chmod -R 755 ${startdir}/pkg/usr/share/abuledu-calculs
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/calculs
  echo "(cd /usr/share/abuledu-calculs && ./Calculs.tcl)" >> ${startdir}/pkg/usr/bin/calculs
  chmod 755 ${startdir}/pkg/usr/bin/calculs
}
