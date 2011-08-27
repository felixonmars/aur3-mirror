pkgname=phpmp2
pkgver=0.11.0
pkgrel=2
pkgdesc="phpMp2 is another web-based client for MPD."
arch=("i686" "x86_64")
url="http://www.musicpd.org/phpMp2.shtml"
depends=('php')
backup=(/home/httpd/html/$pkgname/config.php)
source=(http://mercury.chem.pitt.edu/~shank/phpMp2-$pkgver.tar.bz2)
md5sums=(4b024f42f9d15350731a493a8121c935)

build() {
  instdir=$startdir/pkg/home/httpd/html/phpMp2
  mkdir -p $instdir
  cd $instdir
  cp -ra $startdir/src/phpMp2/* .
}


