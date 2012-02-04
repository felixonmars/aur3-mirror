# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-chemin
pkgver=9.2
pkgrel=1
pkgdesc="Sightings in space (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/abebeta/pool/main/a/abuledu-chemin/abuledu-chemin_9.2-1.tar.gz')
md5sums=('95e875f31c7cd532a807457486e55e32')
install=abuledu-chemin.install

build() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-chemin}
  sed -i 's_abuledu-chemin.png_/usr/share/pixmaps/abuledu-chemin.png_' abuledu-chemin.desktop
  cp -a abuledu-chemin.desktop ${startdir}/pkg/usr/share/applications/abuledu-chemin.desktop
  bzip2 -dc mandrake/abuledu-chemin-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-chemin.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-chemin
  find ${startdir}/pkg/usr/share/abuledu-chemin -name \*\.tcl -exec recode ibmpc..lat1 {} \;
  rm -rf `find ${startdir}/pkg/usr/share/abuledu-chemin -type d -name CVS`
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-chemin
  cp -a aides/* ${startdir}/pkg/usr/share/doc/abuledu-chemin
  chmod -R 755 ${startdir}/pkg/usr/share/abuledu-chemin
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/chemin
  echo "(cd /usr/share/abuledu-chemin && ./chemin.tcl)" >> ${startdir}/pkg/usr/bin/chemin
  chmod 755 ${startdir}/pkg/usr/bin/chemin
}
