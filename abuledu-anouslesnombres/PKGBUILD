# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-anouslesnombres
pkgver=2.2.1
pkgrel=1
pkgdesc="Math learning application from Leterrier (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('abuledu-leterrier')
source=('http://apt.ryxeo.com/leterrier/pool/main/a/abuledu-anouslesnombres/abuledu-anouslesnombres_2.2.1ryxeo1.tar.gz')
md5sums=('c7a8dc4e5c6c25e769b6056328373dfb')
install=abuledu-anouslesnombres.install

build() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications,abuledu-anouslesnombres}
  sed -i 's_abuledu-anouslesnombres.png_/usr/share/pixmaps/abuledu-anouslesnombres.png_' abuledu-anouslesnombres.desktop
  cp -a abuledu-anouslesnombres.desktop ${startdir}/pkg/usr/share/applications/abuledu-anouslesnombres.desktop
  bzip2 -dc mandrake/abuledu-anouslesnombres-48.png.bz2 > ${startdir}/pkg/usr/share/pixmaps/abuledu-anouslesnombres.png
  cp -a * ${startdir}/pkg/usr/share/abuledu-anouslesnombres
  find ${startdir}/pkg/usr/share/abuledu-anouslesnombres -name \*\.tcl -exec recode ibmpc..lat1 {} \;
  rm -rf `find ${startdir}/pkg/usr/share/abuledu-anouslesnombres -type d -name CVS`
  mkdir -p ${startdir}/pkg/usr/share/doc/abuledu-anouslesnombres
  cp -a aide/* ${startdir}/pkg/usr/share/doc/abuledu-anouslesnombres
  chmod -R 755 ${startdir}/pkg/usr/share/abuledu-anouslesnombres
  echo "#!/bin/sh" > ${startdir}/pkg/usr/bin/anous
  echo "(cd /usr/share/abuledu-anouslesnombres && ./anous.tcl)" >> ${startdir}/pkg/usr/bin/anous
  chmod 755 ${startdir}/pkg/usr/bin/anous
}
