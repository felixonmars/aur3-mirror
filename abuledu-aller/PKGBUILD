# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-aller
pkgver=4.0.1
pkgrel=1
pkgdesc="Help children to learn reading (french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/leterrier/pool/main/a/abuledu-aller/abuledu-aller_4.0.1-3ryxeo1.tar.gz')
md5sums=('b7158bf5201cb6f19d569bbaf07a32c1')
install=abuledu-aller.install

build() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/var/leterrier/aller
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-aller}
  sed -i 's_abuledu-aller.png_/usr/share/pixmaps/abuledu-aller.png_' abuledu-aller.desktop
  cp -a abuledu-aller.desktop ${startdir}/pkg/usr/share/applications/abuledu-aller.desktop
  bzip2 -dc mandrake/abuledu-aller-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-aller.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-aller 
  find ${startdir}/pkg/usr/share/abuledu-aller -name \*\.tcl -exec recode ibmpc..lat1 {} \;
  rm -rf `find ${startdir}/pkg/usr/share/abuledu-aller -type d -name CVS`
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-aller
  cp -a aide/* ${startdir}/pkg/usr/share/doc/abuledu-aller
  chmod -R 755 ${startdir}/pkg/usr/share/abuledu-aller
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/aller
  echo "(cd /usr/share/abuledu-aller && ./aller.tcl)" >> ${startdir}/pkg/usr/bin/aller
  chmod 755 ${startdir}/pkg/usr/bin/aller
}
