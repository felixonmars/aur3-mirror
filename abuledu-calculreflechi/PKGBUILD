# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-calculreflechi
pkgver=0.0.3
pkgrel=1
pkgdesc="Number learning application from Leterrier (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/leterrier/pool/main/a/abuledu-calculreflechi/abuledu-calculreflechi_0.0.3-1ryxeo1.tar.gz')
md5sums=('fad168038d5a57eacd6dd78e6354d136')
install=abuledu-calculreflechi.install

build() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-calculreflechi}
  sed -i 's_abuledu-calculreflechi.png_/usr/share/pixmaps/abuledu-calculreflechi.png_' abuledu-calculreflechi.desktop
  cp -a abuledu-calculreflechi.desktop ${startdir}/pkg/usr/share/applications/abuledu-calculreflechi.desktop
  bzip2 -dc mandrake/abuledu-calculreflechi-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-calculreflechi.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-calculreflechi
  find ${startdir}/pkg/usr/share/abuledu-calculreflechi -name \*\.tcl -exec recode ibmpc..lat1 {} \;
  rm -rf `find ${startdir}/pkg/usr/share/abuledu-calculreflechi -type d -name CVS`
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-calculreflechi
  cp -a aide/* ${startdir}/pkg/usr/share/doc/abuledu-calculreflechi
  chmod -R 755 ${startdir}/pkg/usr/share/abuledu-calculreflechi
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/mathoeuf
  echo "(cd /usr/share/abuledu-calculreflechi && ./mathoeuf.tcl)" >> ${startdir}/pkg/usr/bin/mathoeuf
  chmod 755 ${startdir}/pkg/usr/bin/mathoeuf
}
