# $Id:$
# Maintainer: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=perlprimer
pkgver=1.1.14
pkgrel=1
pkgdesc="Tool to design flanking oligo nucleotides for DNA amplification"
arch=('i686' 'x86_64')
license=('GPL')
url="http://perlprimer.sourceforge.net"
depends=('perl-libwww' 'perl-tk')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2
	perlprimer.desktop
	perlprimer.xml
	perlprimer.xpm)

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	install -D -m755 perlprimer.pl ${startdir}/pkg/usr/bin/perlprimer || return 1
	install -D -m644 ../perlprimer.desktop ${startdir}/pkg/usr/share/perlprimer.desktop || return 1
	install -D -m644 ../perlprimer.xpm ${startdir}/pkg/usr/share/pixmaps/perlprimer.xpm || return 1
	install -D -m644 ../perlprimer.xml ${startdir}/pkg/usr/share/mime/packages/perlprimer.xml || return 1

}

md5sums=('b0621177b0021d4f393109a32e514193'
         'ad03d0b2577e1e423308fd21f10e2f25'
         '1bdf15a5662240cd4a6aafb3052da21b'
         '4ee663beba0310398f55a7636f6293b8')
