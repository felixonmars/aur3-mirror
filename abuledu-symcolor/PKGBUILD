# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-symcolor
pkgver=0.0.1
pkgrel=1
pkgdesc="Mirror drawings from Leterrier (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/leterrier/pool/main/a/abuledu-symcolor/abuledu-symcolor_0.0.1-6-1ryxeo1.tar.gz')
md5sums=('d17955f4589fbf7175d729f02f4430dd')
install=abuledu-symcolor.install

build() {
  cd ${startdir}/src/$pkgname-$pkgver-6
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-symcolor}
  sed -i 's_abuledu-symcolor.png_/usr/share/pixmaps/abuledu-symcolor.png_' abuledu-symcolor.desktop
  cp -a abuledu-symcolor.desktop ${startdir}/pkg/usr/share/applications/abuledu-symcolor.desktop
  bzip2 -dc mandrake/abuledu-symcolor-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-symcolor.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-symcolor
#  find ${startdir}/pkg/usr/share/abuledu-symcolor -name \*\.tcl -exec recode ibmpc..lat1 {} \;
#  rm -rf `find ${startdir}/pkg/usr/share/abuledu-symcolor -type d -name CVS`
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-symcolor
  cp -a aide/* ${startdir}/pkg/usr/share/doc/abuledu-symcolor
  chmod -R 755 ${startdir}/pkg/
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/symcolor
  echo "(cd /usr/share/abuledu-symcolor && ./symcolor.tcl)" >> ${startdir}/pkg/usr/bin/symcolor
  chmod 755 ${startdir}/pkg/usr/bin/symcolor
}
