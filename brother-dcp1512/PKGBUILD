# Maintainer: Giovanne Castro <giovannefc@gmail.com>

pkgname=brother-dcp1512
pkgver=3.0.1
pkgrel=1
pkgdesc="Driver for the Brother DCP-1510/1512 multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')

if [[ $CARCH == "x86_64" ]]; then
	depends=('a2ps' 'lib32-libcups')
else
	depends=('a2ps')
fi

makedepends=('rpmextract')
install="brother-dcp1512.install"
arch=('i686' 'x86_64')
source=(
	fix_lp.patch
	http://www.brother.com/pub/bsc/linux/dlf/dcp1510lpr-"$pkgver"-"$pkgrel".i386.rpm
	http://www.brother.com/pub/bsc/linux/dlf/dcp1510cupswrapper-"$pkgver"-"$pkgrel".i386.rpm
)
md5sums=('0317bf337754521aff3c007fcce87c5e'
	 '0402bc86764692b02ef412ba6df3b9de'
	 '49689b80de1b5d08244eb9a9be1399fd')

package()
{
	cd $srcdir
	for i in *.rpm; do
		rpmextract.sh "$i"
	done

	install -d -m755 "$pkgdir/usr/lib/cups/filter"
	install -d -m755 "$pkgdir/usr/share/cups/model/Brother"
	install -d -m755 "$pkgdir/var/spool/lpd/dcp1510"
	
	patch -Np0 < ../fix_lp.patch
	
	cp -r "$srcdir"/opt "$pkgdir"
	mv "$pkgdir"/opt/brother/Printers/DCP1510/cupswrapper/brother-DCP1510-cups-en.ppd "$pkgdir"/usr/share/cups/model/Brother
	mv "$pkgdir"/opt/brother/Printers/DCP1510/cupswrapper/* "$pkgdir"/usr/lib/cups/filter
	rm -rf "$pkgdir"/opt/brother/Printers/DCP1510/cupswrapper
}
