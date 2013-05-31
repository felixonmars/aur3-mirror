# Contributor: Eric Le Bras <eric.lebras@gmail.com>
# Contributor: Jeroen Op 't Eynde <jeroen [at] xprsyrslf [dot] be>

pkgname=cnijfilter-common-3.00
pkgver=3.00
pkgrel=2
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
source=(http://gdlp01.c-wss.com/gds/8/0100001598/01/cnijfilter-common-$pkgver-1.i386.rpm)
md5sums=('4d7699a80c06886d4a2219d497203bb1')

package() {
	mkdir -p $pkgdir/usr/share/doc/$pkgname
if [ "${CARCH}" = 'x86_64' ]; then
	mkdir -p $pkgdir/usr/lib32/cups
elif [ "${CARCH}" = 'i686' ]; then
	mkdir -p $pkgdir/usr/lib/cups
fi
	mkdir -p $pkgdir/usr/bin
	mv -v $srcdir/usr/share/doc/cnijfilter-common-3.00/* $pkgdir/usr/share/doc/$pkgname
	mv -v $srcdir/usr/local/bin* $pkgdir/usr/bin
if [ "${CARCH}" = 'x86_64' ]; then
	mv -v $srcdir/usr/lib/cups/* $pkgdir/usr/lib32/cups/
elif [ "${CARCH}" = 'i686' ]; then
	mv -v $srcdir/usr/lib/cups/* $pkgdir/usr/lib/cups/
fi
}
