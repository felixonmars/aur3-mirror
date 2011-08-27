# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-labyrinthe
pkgver=1.3.1
pkgrel=1
pkgdesc='Sightings in space II (in french)'
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/leterrier/pool/main/a/abuledu-labyrinthe/abuledu-labyrinthe_1.3.1ryxeo1.tar.gz')
md5sums=('73c9b194431a08b315cf415bedc974f3')


build() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-labyrinthe}
  sed -i 's_abuledu-labyrinthe.png_/usr/share/pixmaps/abuledu-labyrinthe.png_' abuledu-labyrinthe.desktop
  cp -a abuledu-labyrinthe.desktop ${startdir}/pkg/usr/share/applications/abuledu-labyrinthe.desktop
  bzip2 -dc mandrake/abuledu-labyrinthe-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-labyrinthe.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-labyrinthe
  find ${startdir}/pkg/usr/share/abuledu-labyrinthe -name \*\.tcl -exec recode ibmpc..lat1 {} \;
  rm -f ${startdir}/pkg/usr/share/abuledu-labyrinthe/runbrowser
  rm -rf `find ${startdir}/pkg/usr/share/abuledu-labyrinthe -type d -name CVS`
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-labyrinthe
  cp -a aide/* ${startdir}/pkg/usr/share/doc/abuledu-labyrinthe
  chmod -R 755 ${startdir}/pkg/usr/share/abuledu-labyrinthe
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/labyrinthe
  echo "(cd /usr/share/abuledu-labyrinthe && ./labyrinthes.tcl)" >> ${startdir}/pkg/usr/bin/labyrinthe
  chmod 755 ${startdir}/pkg/usr/bin/labyrinthe
}
