# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-tableaux
pkgver=8.12
pkgrel=1
pkgdesc="School program to manipulate double arrays (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/abebeta/pool/main/a/abuledu-tableaux/abuledu-tableaux_8.12.tar.gz')
md5sums=('df7cfd1f77a05d8104205d5241336bbe')


build() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-tableaux}
  sed -i 's_abuledu-tableaux.png_/usr/share/pixmaps/abuledu-tableaux.png_' abuledu-tableaux.desktop
  cp -a abuledu-tableaux.desktop ${startdir}/pkg/usr/share/applications/abuledu-tableaux.desktop
  bzip2 -dc mandrake/abuledu-tableaux-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-tableaux.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-tableaux
  find ${startdir}/pkg/usr/share/abuledu-tableaux -name \*\.tcl -exec recode ibmpc..lat1 {} \;
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-tableaux
  cp -a aides/* ${startdir}/pkg/usr/share/doc/abuledu-tableaux
  chmod -R 755 ${startdir}/pkg/
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/tableaux
  echo "(cd /usr/share/abuledu-tableaux && ./tableaux.tcl)" >> ${startdir}/pkg/usr/bin/tableaux
  chmod 755 ${startdir}/pkg/usr/bin/tableaux
}
