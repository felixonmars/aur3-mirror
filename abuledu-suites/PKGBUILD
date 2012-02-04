# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-suites
pkgver=2.0.0
pkgrel=1
pkgdesc="Numbers suites in mathematics (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/leterrier/pool/main/a/abuledu-suites/abuledu-suites_2.0.0-12ryxeo3.tar.gz')
md5sums=('80d8cc10ae05224906c8b9870ead4283')
install=abuledu-suites.install

build() {
  cd ${startdir}/src/abuledu-suites_2.0.0-4
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-suites}
  sed -i 's_abuledu-suites.png_/usr/share/pixmaps/abuledu-suites.png_' abuledu-suites.desktop
  cp -a abuledu-suites.desktop ${startdir}/pkg/usr/share/applications/abuledu-suites.desktop
  bzip2 -dc mandrake/abuledu-suites-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-suites.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-suites
  find ${startdir}/pkg/usr/share/abuledu-suites -name \*\.tcl -exec recode ibmpc..lat1 {} \;
  rm -rf `find ${startdir}/pkg/usr/share/abuledu-suites -type d -name CVS`
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-suites
  cp -a aide/* ${startdir}/pkg/usr/share/doc/abuledu-suites
  chmod -R 755 ${startdir}/pkg/
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/suites
  echo "(cd /usr/share/abuledu-suites && ./suites.tcl)" >> ${startdir}/pkg/usr/bin/suites
  chmod 755 ${startdir}/pkg/usr/bin/suites
}
