# Contributor: Jonathan Wiersma <archaur at jonw dot org>
pkgname=fcc
pkgver=10.014
pkgrel=2
pkgdesc="FirstClass Client Groupware Client"
arch=('i686' 'x86_64')
url='http://www.firstclass.com/Divisions/FAV13-0024FC95/?Plugin=FC&OpenItemURL=S047C50E4'
license=('unknown')
install="fcc.install"
if [ "$CARCH" = "i686" ]; then
	depends=('alsa-lib' 'libart-lgpl' 'libjpeg6' 'libpng' 'qt3')
else
	depends=('lib32-alsa-lib' 'libart-lgpl' 'lib32-libjpeg6' 'lib32-libpng' 'lib32-libpng12' 'lib32-qt3' 'qt3')
	provides=("bin32-fcc=$pkgver")
	conflicts=('bin32-fcc')
	replaces=('bin32-fcc')
fi
options=('emptydirs')
source=("fcc.install" "http://www3.firstclass.com/ClientDownloads/FC100ClientDownloadFiles/$pkgname-"${pkgver}"-Linux.i686.tar.bz2")

build() {
	cd $srcdir/opt
	find firstclass -type d ! -regex ".*[/]\.svn[/]?.*" \
		-exec install -dm755 $pkgdir/opt/{} \;
	find firstclass -type f ! -regex ".*[/]\.svn[/]?.*" \
		-exec install -Dm644 {} $pkgdir/opt/{} \;
	
	install -m755 firstclass/fcc $pkgdir/opt/firstclass
	cd $srcdir/usr/share/applications
	install -d $pkgdir/usr/share/applications
	install -m644 fcc.desktop $pkgdir/usr/share/applications
}

md5sums=('80bea1ae741374fc045f47505469bebf'
         '639d14ec38c2a5637373592de77d9171')
