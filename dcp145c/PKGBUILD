pkgname=dcp145c
pkgver=1.1.2_2
pkgrel=3
pkgdesc="Brother DCP-145C printer driver"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#DCP-145C"
license=('GPL')
depends=('cups' 'ghostscript')
test "$CARCH" = 'x86_64' && depends+=('lib32-glibc')
source=("http://www.brother.com/pub/bsc/linux/dlf/${pkgname}cupswrapper-${pkgver/_/-}.i386.rpm"
	"http://www.brother.com/pub/bsc/linux/dlf/${pkgname}lpr-${pkgver/_/-}.i386.rpm")
md5sums=('58ec23ccb3e8d7617006b9659fb36a95'
         'bd8b8ab373172266eed34040658344be')
_brdirprefix="usr/local/Brother/Printer/dcp145c"

_brscriptgen() {
	sed -n -e '/^[a-z_]*=/p' $1
	echo "cat <<ENDOFHEREDOC"
	sed -e "0,/<<$2/d" -e "/^$2\$/,\$d" $1
	echo "ENDOFHEREDOC"
}

build() {
	_brscriptgen "${srcdir}/${_brdirprefix}/cupswrapper/cupswrapperdcp145c" \
	ENDOFPPDFILE1 > ppd_file.brscript
	sh ppd_file.brscript > ppd_file

	_brscriptgen "${srcdir}/${_brdirprefix}/cupswrapper/cupswrapperdcp145c" \
	'!ENDOFWFILTER!' > wrapper.brscript
	sh wrapper.brscript > wrapper
}

package() {
	install -m 644 -D ppd_file "${pkgdir}/usr/share/cups/model/brdcp145c.ppd"
	install -m 755 -D wrapper "${pkgdir}/usr/lib/cups/filter/brlpdwrapperdcp145c"
	
	cp -r "${srcdir}/usr/" "${pkgdir}"
	rm "${pkgdir}/${_brdirprefix}/cupswrapper/cupswrapperdcp145c"
	rm "${pkgdir}/${_brdirprefix}/inf/setupPrintcapij"
	chmod a+w "${pkgdir}/${_brdirprefix}/inf/brdcp145crc"
	chmod a+w "${pkgdir}/${_brdirprefix}/inf"
}
