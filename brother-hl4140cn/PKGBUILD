#Maintainer: Mathieu Clabaut <mathieu@clabaut.net>
# This borrows heavily from the PKGBUILD for the brother hl2140. 
# A big thank you to the maintainer and contributors of that build.
# This is my first PKGBUILD, and it wouldn't have been possible without
# their work. 

pkgname=brother-hl4140cn
pkgver=1.1.1
pkgrel=5
pkgdesc="Brother HL-4140CN CUPS printer driver"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#HL-2140"
license=('custom:Brother' 'GPL')
depends=('a2ps' 'cups')
makedepends=('libarchive')
install="brother-hl4140cn.install"
arch=('i686' 'x86_64')

if [[ -z "$CARCH" ]]; then
	echo ":: PKGBUILD could not detect your architecture. Some dependencies may be missing."
else
	if [[ "$CARCH" == "x86_64" ]]; then
		depends+=('lib32-glibc')
	fi
fi
	#http://download.brother.com/welcome/dlf005935/hl4140cnlpr-1.1.1-5.i386.rpm

source=(0001-brother-hl4140cn.patch
        Brother.license
        http://pub.brother.com/pub/com/bsc/linux/dlf/hl4140cnlpr-${pkgver}-${pkgrel}.i386.rpm
        http://pub.brother.com/pub/com/bsc/linux/dlf/hl4140cncupswrapper-${pkgver}-${pkgrel}.i386.rpm)

build() {
	cd "$srcdir"
	for n in *.rpm; do
		bsdtar xf "$n"
	done

	patch -p1 < 0001-brother-hl4140cn.patch

	install -d "$pkgdir/usr/share"
	cp -R usr/bin "$pkgdir/usr";
	cp -R usr/local/Brother "$pkgdir/usr/share/Brother"

	echo Fixing paths...
	find $pkgdir -type f -exec sed -i s#/usr/local/Brother#/usr/share/Brother#g {} \;

	echo "Installing PPD."
	mkdir -p $pkgdir/usr/share/cups/model/

	if [[ "$CARCH" == "x86_64" ]]; then
		mkdir -p $pkgdir/usr/lib64/cups/filter
	else
		mkdir -p $pkgdir/usr/lib/cups/filter
	fi

	PKGDIR=$pkgdir SRCDIR=$srcdir DESTDIR=$pkgdir DRIVER_PREFIX=/usr/share/Brother \
	usr/local/Brother/Printer/hl4140cn/cupswrapper/cupswrapperhl4140cn -s

	rm $pkgdir/usr/share/Brother/Printer/hl4140cn/cupswrapper/cupswrapperhl4140cn 
	rm $pkgdir/usr/share/Brother/Printer/hl4140cn/inf/setupPrintcapij

	chmod 755 "$pkgdir/usr/share/Brother/Printer/hl4140cn/inf" 
	chmod 644 "$pkgdir/usr/share/Brother/Printer/hl4140cn/inf/brhl4140cnrc"
	install -Dm644 Brother.license $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('76674821a078cbafe725feebdea0b02c'
         '58796468c65d77c835e5959970b91f36'
         '7bcea13b999fe2a0c0c917ac7f918c9f'
         'cda2ea1c7f5d9263833074c91b2a6931')
