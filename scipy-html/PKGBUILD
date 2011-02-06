 #piggy1983
#2009-12-8

pkgname=scipy-html
pkgver=snapshot
pkgrel=1
pkgdesc=("Scipy Documentation")
arch=(any)
url=('http://docs.scipy.org')
license=('BSD')
source=("http://docs.scipy.org/doc/scipy/${pkgname}.zip")
md5sums=('dca70eb3031f6b015a2ba7d1b8dfd49c')

build()
{
	cd $srcdir/
        rm -f ${pkgname}.zip
        find -not -type d -exec chmod 644 {} \;
	
	INSTALLDIR=/usr/share/doc/scipy

	mkdir -p $pkgdir$INSTALLDIR
	mv * $pkgdir$INSTALLDIR/
}


