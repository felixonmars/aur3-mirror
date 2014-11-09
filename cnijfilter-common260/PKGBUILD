# Contributor: Eric Le Bras <eric.lebras@gmail.com>
# Contributor: Jeroen Op 't Eynde <jeroen [at] xprsyrslf [dot] be>

pkgname=cnijfilter-common260
pkgver=2.60
pkgrel=1
pkgdesc="Canon IJ Printer Driver (Common package)"
url="http://support-my.canon-asia.com/contents/MY/EN/0100159804.html"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-libcups' 'lib32-popt')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('libcups' 'popt')
fi
makedepends=('rpmextract')
source=(http://gdlp01.c-wss.com/gds/2/0900007182/01/cnijfilter-common-2.60-3.i386.rpm)
md5sums=('36eb19c1205dfe713cd3b72d7f8bfcae')

package() {
	cd ${pkgdir}
	rpmextract.sh $startdir/src/cnijfilter-common-$pkgver-3.i386.rpm
	mkdir -p usr/share/licenses/${pkgname}
	#mv usr/share/doc/cnijfilter-common-$pkgver/* usr/share/licenses/${pkgname}
	#rm -rf usr/share/doc
	chmod -R a+rX usr/
} 
