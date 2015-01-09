# Maintainer: Vishnyakov V. <split7fire at yandex dot ru>

pkgname=iscan-plugin-cx4400
pkgver=2.1.3_1
pkgrel=2
pkgdesc="iscan plugin for Epson Stylus CX4300/CX4400/CX4450/CX5500/CX5600/DX4400/DX4450 scanners."
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=ES&CN2=&DSCMI=15833&DSCCHK=39c8d6560988f8ddd55e9a11c6d11d6f60bc3c91"
license=('GPL' 'LGPL' 'EAPL')
depends=('iscan')

if [[ $CARCH == 'i686' ]]
then
	source=("http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/33/7194a67418bc9c58c6bbb8ae695e1d29cf4f3fee/iscan-plugin-cx4400-2.1.3-1.i386.rpm")
	md5sums=('2925b88a5db05317c1c2d606ea997515')
else
	source=("http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/58/33/9be9e1b8f53149889cd18e1103463445e9474dd5/iscan-plugin-cx4400-2.1.3-1.x86_64.rpm")
	md5sums=('4811c91fb317cb310f4e02db7cb855be')
fi

install="iscan-plugin-cx4400.install"


package() {
	cd "$srcdir"
	cp -dpr --no-preserve=ownership usr/share "$pkgdir"/usr
	if [[ $CARCH == 'x86_64' ]]
	then
		cp -dpr --no-preserve=ownership usr/lib64 "$pkgdir"/usr/lib
	else
		cp -dpr --no-preserve=ownership usr/lib "$pkgdir"/usr/lib
	fi
	install -D -m 644 "$pkgdir"/usr/doc/"$pkgname"-${pkgver//_1/}/AVASYSPL.en.txt "$pkgdir"/usr/share/licenses/"$pkgname"/AVASYSPL.en.txt
	install -D -m 644 "$pkgdir"/usr/doc/"$pkgname"-${pkgver//_1/}/AVASYSPL.ja.txt "$pkgdir"/usr/share/licenses/"$pkgname"/AVASYSPL.ja.txt
	rm -r "$pkgdir"/usr/doc
}
