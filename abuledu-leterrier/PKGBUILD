# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=abuledu-leterrier
pkgver=2.2.0
pkgrel=1
pkgdesc="Common files for Leterrier applications (in french)"
url="http://www.abuledu.org/leterrier/accueil"
license=('GPL')
arch=('i686' 'x86_64')
depends=('tcl' 'tk' 'snack' 'tkimg')
source=('http://apt.ryxeo.com/leterrier/pool/main/a/abuledu-leterrier/abuledu-leterrier_2.2.0-27ryxeo2.tar.gz')
md5sums=('88e54bfc141b8b7a75a4803bd52f0557')
install=leterrier.install


build() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/abuledu-sokoban
  mkdir -p ${startdir}/pkg/var/leterrier
  cp leterrier_log ${startdir}/pkg/usr/bin
  cp runbrowser ${startdir}/pkg/usr/bin
  cp -R sokoban/* ${startdir}/pkg/usr/share/abuledu-sokoban
  chmod +s ${startdir}/pkg/usr/bin/leterrier_log
}
