# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-mulot
pkgver=8.4.1
pkgrel=1
pkgdesc="A mouse-training tool for young children (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/leterrier/pool/main/a/abuledu-mulot/abuledu-mulot_8.11bryxeo1.tar.gz')
md5sums=('ba93c71d4f15c60200e841f1b717c29b')
install=abuledu-mulot.install

build() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-mulot}
  sed -i 's_abuledu-mulot.png_/usr/share/pixmaps/abuledu-mulot.png_' abuledu-mulot.desktop
  cp -a abuledu-mulot.desktop ${startdir}/pkg/usr/share/applications/abuledu-mulot.desktop
  bzip2 -dc mandrake/abuledu-mulot-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-mulot.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-mulot
  find ${startdir}/pkg/usr/share/abuledu-mulot -name \*\.tcl -exec recode ibmpc..lat1 {} \;
  rm -rf `find ${startdir}/pkg/usr/share/abuledu-mulot -type d -name CVS`
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-mulot
  cp -a aides/* ${startdir}/pkg/usr/share/doc/abuledu-mulot
  chmod -R 755 ${startdir}/pkg/usr/share/abuledu-mulot
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/mulot
  echo "(cd /usr/share/abuledu-mulot && ./mulot.tcl)" >> ${startdir}/pkg/usr/bin/mulot
  chmod 755 ${startdir}/pkg/usr/bin/mulot
}
