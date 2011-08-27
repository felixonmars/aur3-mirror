# Contributor: Norberto Lopes <shelika@mail.telepac.pt>
pkgname=projectpier
pkgver=0.8.0.3
pkgrel=1
pkgdesc="ProjectPier is a Free, Open-Source, self-hosted PHP application for managing tasks, projects and teams through an intuitive web interface."
arch=(i686 x86_64)
url="http://www.projectpier.org/"
license=('custom:HPL')
depends=('apache' 'php' 'mysql')
install=('projectpier.install')
source=(http://downloads.sourceforge.net/projectpier/$pkgname-$pkgver.zip)
md5sums=('2a9d02791420a16d0719900a404cd052')
noextract=()

build() {
  cd $startdir/src/
  install -d -m0755 $startdir/pkg/srv/www
  mv $pkgname-$pkgver $startdir/pkg/srv/www/projectpier

  # license stuff
  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 $startdir/pkg/srv/www/projectpier/license.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
