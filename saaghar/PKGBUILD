# Maintainer: FzerorubigD <fzerorubigd {AT} Gmail {Dot} Com

pkgname=saaghar
pkgver=1.0.94
pkgrel=1
pkgdesc="Saaghar is a Persian poetry software written by C++ under Qt framework, it uses ganjoor database as its database. It has tab feature in both its Viewer and its Search page that cause it be suitable for research goals. "
url="http://pojh.iblogger.org/"
arch=('any')
license=('GPL3')
depends=('qt>=4.6.2')
makedepends=('p7zip' 'tar')

source=(Saaghar-${pkgver}.tar.gz::"http://sourceforge.net/projects/saaghar/files/Source%20Code/Saaghar-${pkgver}.tar.gz/download"
saaghar-data_59.90.07.deb::"http://sourceforge.net/projects/saaghar/files/Linux/Ubuntu-n-Debian/saaghar-data-59.90.07.deb/download"
saaghar-db
saaghar.install
)
md5sums=('89197b09b952fbe2b130c50fedd0493d'
         '18f7b80ac4d87867c2824fba639f3bef'
         '33dac266e7be2fa1d7797dc2d493e4d5'
         '813635bedad8db3295ff2a49b394bfcc')

install=$pkgname.install
build() {
	cd $srcdir
	#patch -Np1 -i  $srcdir/arch.patch
	7z e -y ./saaghar-data_59.90.07.deb
	tar xvf ./data.tar
	cd Saaghar
	qmake
	make
	mkdir $pkgdir/{usr,usr/{bin,share,share/{saaghar,pixmaps,applications}}}
	cp -R $srcdir/Saaghar/utilities/poets_images $pkgdir/usr/share/saaghar/ 
	install -m644 $srcdir/Saaghar/utilities/{AUTHORS,COPYING,Saaghar.desktop,CHANGELOG,README,TODO,qt_fa.qm,saaghar_fa.qm,Saaghar-Manual.pdf} $pkgdir/usr/share/saaghar 
	install -m644 $srcdir/usr/share/saaghar/ganjoor.s3db $pkgdir/usr/share/saaghar
	install -m755 $srcdir/Saaghar/saaghar $pkgdir/usr/bin
	install -m755 $srcdir/saaghar-db $pkgdir/usr/bin
	install -m644 $srcdir/Saaghar/images/saaghar.png $pkgdir/usr/share/pixmaps
	install -m644 $srcdir/Saaghar/utilities/Saaghar.desktop $pkgdir/usr/share/applications
}


