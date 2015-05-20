# Contributor: Mariano Copetti <marianocopetti@gmail.com>

pkgname=keme
pkgver=2.9.8.5
pkgrel=1
pkgdesc="KEME Contabilidad"
arch=('i686' 'x86_64')
url="http://keme.sourceforge.net/"
license=('GPL')
depends=('qt4' 'texlive-core' 'texlive-latexextra' 'sqlite3' 'kdegraphics-okular')
makedepends=()
optdepends=('postgresql: for PostgreSQL Database' 'mysql: for MySQL Database')
source=("http://ufpr.dl.sourceforge.net/sourceforge/keme/keme-contabilidad-$pkgver.tar.gz")
md5sums=('2c492dbfddf3551885c91e2fbc0cb5e6')

package() {
cd $startdir/src/$pkgname-contabilidad-$pkgver
qmake keme4.pro
make || return 1
install -d $startdir/pkg/usr/share/doc/keme4/manual
install -D -m755 keme4 $startdir/pkg/usr/bin/keme4
install -D -m644 bootsplash/KEME-Contabilidad.desktop $startdir/pkg/usr/share/applications/KEME-Contabilidad.desktop
install -D -m644 bootsplash/keme.xpm $startdir/pkg/usr/share/pixmaps/keme.xpm
install -D -m644 bootsplash/splash.png $startdir/pkg/usr/share/keme4/splash.png
install -D -m644 manual/* $startdir/pkg/usr/share/doc/keme4/manual/
install -D -m644 archivos/* $startdir/pkg/usr/share/doc/keme4/
install -D -m644 licencias/* $startdir/pkg/usr/share/doc/keme4/
} 

