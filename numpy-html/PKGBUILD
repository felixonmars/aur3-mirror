 #piggy1983
#2009-12-8

pkgname=numpy-html
pkgver=snapshot
pkgrel=1
pkgdesc=("Documentation for numpy")
arch=(any)
url=('http://docs.scipy.org')
license=('BSD')
source=("http://docs.scipy.org/doc/numpy/${pkgname}.zip")
md5sums=('62576925c95a130c950b3a9f01df6af4')

build()
{
	cd $srcdir/
        rm -f ${pkgname}.zip
	
	INSTALLDIR=/usr/share/doc/numpy

	mkdir -p $pkgdir$INSTALLDIR
	mv * $pkgdir$INSTALLDIR/
}


