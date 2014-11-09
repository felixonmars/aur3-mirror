# Contributor: Allen Choong <allencch at hotmail dot com>

pkgname=cnijfilter-ip2200
pkgver=2.60
pkgrel=5
pkgdesc="Canon IJ Printer Driver for PIXMA iP2200 (compatible to iP1600)"
url="http://support-sg.canon-asia.com/contents/SG/EN/0900718701.html"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-libcups' 'lib32-popt' 'cnijfilter-common260' 'lib32-gtk')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('libcups' 'popt' 'cnijfilter-common' 'gtk' 'libtiff3' 'libxml')
fi
makedepends=('rpmextract')
source=(http://gdlp01.c-wss.com/gds/7/0900007187/01/$pkgname-$pkgver-2.i386.rpm)
md5sums=('f4112bdd717c2ecce9b999acdc50fa7e')

package() {
  cd "$pkgdir"
  rpmextract.sh "$srcdir/$pkgname-$pkgver-2.i386.rpm"
  mkdir -p usr/share/licenses/${pkgname}
  chmod -R a+rX usr/
}

