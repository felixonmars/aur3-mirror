# Maintainer: TuxSpirit<tuxspirit@archlinux.fr>   2008/06/12 22:36 CET TuxSpirit
# Contributor: mightyjaym <jm.ambrosino@free.fr>  2008/06/12 22:16 CET mightyjaym, for 64 bit

pkgname=backerupper
pkgver=0.24
pkgrel=3
pkgdesc="Backerupper is a simple program for backing up selected directories over a local network"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
url=http://sourceforge.net/projects/backerupper/

if [ "$CARCH" = "x86_64" ]; then
	_nbits=64
	md5sums=('4981638e57b8ad01f09ab2645700338b'
		'ff77d7bac49d815e98a3f2bd24edb538')
else	_nbits=32
        md5sums=('0fd0e8c0b592fb510676e4d4553b5637'
                 'ff77d7bac49d815e98a3f2bd24edb538')
fi

source=(http://downloads.sourceforge.net/backerupper/$pkgname-$pkgver-${_nbits}.tar.gz \
       backerupper.desktop)
install=${pkgname}.install

build() {
 #Structure
 install -d -m 755 ${startdir}/pkg/usr/share/${pkgname}
 install -d -m 755 ${startdir}/pkg/usr/share/${pkgname}/doc
 
 #Program
 install -m 755 ${startdir}/src/${pkgname}-${pkgver}-${_nbits}/backer ${startdir}/pkg/usr/share/${pkgname}/backer

 #Doc for program
 install -m 644 ${startdir}/src/${pkgname}-${pkgver}-${_nbits}/doc/* ${startdir}/pkg/usr/share/${pkgname}/doc

 #AddOn Desktop
 install -D -m 644 ${startdir}/src/backerupper.desktop ${startdir}/pkg/usr/share/applications/backerupper.desktop

}
