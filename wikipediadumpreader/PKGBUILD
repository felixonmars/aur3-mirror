# Maintainer: Fred Romano < f r e d r o m a n o curlysign g m a i l point c o m >
# Contributor: Orivej Desh <smpuj@bk.ru>
pkgname=wikipediadumpreader
_pkgname=wikipediaDumpReader
pkgver=0.2.10
pkgrel=2
pkgdesc="An application to easily read Wikipedia's downloaded dump files."
arch=("i686" "x86_64")
url="http://www.kde-apps.org/content/show.php/Wikipedia+Dump+Reader?content=65244"
license=("GPL")
depends=("python2-pyqt" "texvc")
makedepends=()
source=("http://launchpad.net/wikipediadumpreader/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz"
        "Makefile" "wikipediadumpreader" "wikipediadumpreader.patch")
md5sums=('2519f7078b47e853246ba1c8fd89f53d'
         '17adda73dcb7e1d828156bcfaa6cc260'
         '578b5d246d6a23078fb9272bdda26eb5'
         'e101ff41e4b8fafbc5388a803ad5fe48')

build() {
  cd $srcdir/$_pkgname-$pkgver
  patch -Np1 -i ../$pkgname.patch || return 1	
  make -C src -f $srcdir/Makefile || return 1
  make -C zran_wdr_src || return 1
  DESTDIR="$pkgdir/usr/share/wikipediadumpreader"
  install -d "$DESTDIR/mod"
  install -m644 QTextBrowser2.py convert_idx_s.py form3.ui loader.ui mathexp.py mparser.py "$DESTDIR"
  install -m755 dumpReader.py "$DESTDIR"
  install -m755 src/bz2.so "$DESTDIR/mod"
  install -m755 zran_wdr_src/zran "$DESTDIR/zran_wdr"
  touch "$DESTDIR/mod/__init__.py"
  install -Dm755 "$srcdir/wikipediadumpreader" "$pkgdir/usr/bin/wikipediadumpreader"
}

