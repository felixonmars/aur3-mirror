# Maintainer: Iip Umar Rifai <iip.umar.rifai@gmail.com>
pkgname=hdcalcul-git
pkgver=20150419
pkgrel=1
pkgdesc="Simple Harbour calculator sample for HDroidGUI"
arch=('i686' 'x86_64')
url="http://kresin.ru/en/hdroid.html"
license=('GPL')
groups=('devel')
depends=()
makedepends=('harbour-git' 'hdroidgui')
optdepends=()
provides=('hdcalcul')
conflicts=('hdcalcul')
replaces=()
backup=()
options=('staticlibs')
changelog=
source=(https://github.com/alkresin/hdcalcul/archive/master.zip)
noextract=()
md5sums=('SKIP')

build() {
	cd "$srcdir/hdcalcul-master"
	chmod +x ./build.sh
	chmod +x ./clear.sh
	chmod +x ./run.sh
	chmod +x ./setenv.sh
	sed -i 's/\(HDROIDGUI\s*=\s*\).*$/\1\/opt\/HDroidGUI/' setenv.sh
	sed -i "s/linux-x86\//linux-$CARCH\//g" build.sh
}

package() {
  cd "$srcdir/hdcalcul-master"
  install -d "$pkgdir/opt/hdcalcul"
  cp -r . "$pkgdir/opt/hdcalcul"
}

