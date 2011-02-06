# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-associations
pkgver=3.0.0
pkgrel=1
pkgdesc="Help children make mental associations, pictures/words and pictures/sounds (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier' 'esound')
source=('http://apt.ryxeo.com/leterrier/pool/main/a/abuledu-associations/abuledu-associations_3.0.0-3ryxeo3.tar.gz')
md5sums=('83c8658f4aa19165ff9c4d22d39f1a11')
install=abuledu-associations.install

build() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-associations}
  sed -i 's_abuledu-associations.png_/usr/share/pixmaps/abuledu-associations.png_' abuledu-associations.desktop
  cp -a abuledu-associations.desktop ${startdir}/pkg/usr/share/applications/abuledu-associations.desktop
  bzip2 -dc mandrake/abuledu-associations-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-associations.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-associations
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-associations
  cp -a aide/* ${startdir}/pkg/usr/share/doc/abuledu-associations
  chmod -R 755 ${startdir}/pkg/usr/share/abuledu-associations
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/associations
  echo "(cd /usr/share/abuledu-associations && ./associations.tcl)" >> ${startdir}/pkg/usr/bin/associations
  chmod 755 ${startdir}/pkg/usr/bin/associations
}
