# Contributor: T.Cunly

pkgname=geant3
pkgver=21_2006_3
pkgrel=1
pkgdesc="Detector Description and Simulation Tool"
arch=('x86_64')
url="http://wwwasd.web.cern.ch/wwwasd/geant"
license=('GPL')

depend=(rpmextract cernlib)
URLROOT=http://ftp.heanet.ie/pub/fedora/linux/releases/11/Everything/x86_64/os/Packages

source=($URLROOT/geant321-2006-32.fc11.x86_64.rpm $URLROOT/geant321-g77-2006-32.fc11.x86_64.rpm )
md5sums=('4bec9f85fb87e6f379802409bb7c804e' 'c47ff18ce6d2659c064d2975cefd7e87')

build() {
	rm $startdir/*.pkg.*
	rm -r $srcdir/etc $srcdir/usr
	cd "$srcdir"
	
	file=`ls`
	
	for i in $file
	do
		rpmextract.sh $i
	done
	
	cd "$srcdir"
	mv usr $pkgdir/
}
 
 
