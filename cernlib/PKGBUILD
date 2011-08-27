# Contributor: piggy1983@163.com
# Maybe need other packages.

pkgname=cernlib
pkgver=2006_35
pkgrel=1
pkgdesc="Large collection of general purpose libraries and modules in Fortran and C developed at CERN, oriented towards the needs of a physics research laboratory."
arch=('x86_64')
url="http://cernlib.web.cern.ch/cernlib"
license=('GPL')

depend=(rpmextract)
URLROOT=http://ftp.heanet.ie/pub/fedora/linux/releases/14/Everything/x86_64/os/Packages

install=cernlib.install
source=($URLROOT/cernlib-2006-35.fc14.x86_64.rpm \
	$URLROOT/cernlib-static-2006-35.fc14.x86_64.rpm   \
	$URLROOT/cernlib-utils-2006-35.fc14.x86_64.rpm \
	$URLROOT/cernlib-devel-2006-35.fc14.x86_64.rpm \
        $URLROOT/cernlib-packlib-gfortran-2006-35.fc14.x86_64.rpm  \
	$URLROOT/patchy-gfortran-2006-35.fc14.x86_64.rpm )
md5sums=('b7663180d1acf72de5342f0c6f9495a9'
         '5883954bd49a05022897feb0ce7949f3'
         '19c388a15d9fa0a1fa3196a363856645'
         'fe474e9888d920c8e912073526962f3d'
         '0010464607246e64f730aed0eec60c7b'
         'e6f13470b3abcb2628930721a0410e4b')
build() {
	cd "$srcdir"
	
	for i in `ls`
	do
		rpmextract.sh $i
	done

	mkdir -p $pkgdir/usr/local/lib/cernlib2006
        cp -a usr/lib64/cernlib/2006/lib/*  $pkgdir/usr/local/lib/cernlib2006/
        cp -a usr/{bin,include,share}  $pkgdir/usr/local/

        echo "!!!ATTENTION!!!"
        echo "If you have already installed the old version, You must uninstalled the old one first!!!"

        
}
 
