# Contributor: Rick Rein <jeebusroxors@gmail.com>
# Contributor: Peter Baldwin <bald_pete@hotmail.com>
# Contributor: Andrew Belitsky <belitsky.a@gmail.com>
pkgname=ip2200
pkgver=2.60
pkgrel=6
pkgdesc="Canon Print Filter for Pixma iP2200 printer"
url="http://software.canon-europe.com/products/0010231.asp"
depends=('libxml' 'libpng12' 'libtiff' 'libjpeg' 'zlib')
makedepends=('rpmextract')
arch=('i686' 'x86_64')
license=('custom')
source=("http://files.canon-europe.com/files/soft24301/software/24301.tgz"
	LICENSE)
md5sums=('4333598b32b9b89326f2f6eb7351fade'
         '4df9593c184cd39bb9d9df6195c4d390')
build() {
	cd $srcdir
	tar -xf iP2200_Linux_260.tar.gz
	cd $pkgdir
	rpmextract.sh $srcdir/cnijfilter-common-2.60-1.i386.rpm  
	rpmextract.sh $srcdir/cnijfilter-ip2200-lprng-2.60-1.i386.rpm
	rpmextract.sh $srcdir/cnijfilter-ip2200-2.60-1.i386.rpm
	chmod -R a+rX usr/
	mkdir -p $pkgdir/usr/licenses/$pkgname/
	cp $srcdir/LICENSE $pkgdir/usr/licenses/$pkgname/LICENSE
}
