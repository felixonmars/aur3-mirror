# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-operations
pkgver=9.3
pkgrel=1
pkgdesc="Maths operations from LeTerrier (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/abebeta/pool/main/a/abuledu-operations/abuledu-operations_9.3-2.tar.gz')
md5sums=('78ed62efc9e9b54b50fc90fa49477680')


build() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-operations}
  sed -i 's_abuledu-operations.png_/usr/share/pixmaps/abuledu-operations.png_' abuledu-operations.desktop
  cp -a abuledu-operations.desktop ${startdir}/pkg/usr/share/applications/abuledu-operations.desktop
  bzip2 -dc mandrake/abuledu-operations-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-operations.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-operations
  find ${startdir}/pkg/usr/share/abuledu-operations -name \*\.tcl -exec recode ibmpc..lat1 {} \;
  rm -f  ${startdir}/pkg/usr/share/abuledu-operations/{runbrowser,shellexec.exe}
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-operations
  cp -a aide/* ${startdir}/pkg/usr/share/doc/abuledu-operations
  chmod -R 755 ${startdir}/pkg/usr/share/abuledu-operations
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/operations
  echo "(cd /usr/share/abuledu-operations && ./operations.tcl)" >> ${startdir}/pkg/usr/bin/operations
  chmod 755 ${startdir}/pkg/usr/bin/operations
}
