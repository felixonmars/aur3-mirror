 #piggy1983
#2009-12-8

pkgname=scipydoc-zh
pkgver=1
pkgrel=1
pkgdesc=("The Documentation for Scientific Computing using Python")
arch=(any)
url=('http://hyry.dip.jp')
license=('unknown')
source=("http://hyry.dip.jp/files/scipydoc.zip")
md5sums=('80bf3acda5d19f66fbe82760bb35340f')

build()
{
	cd $srcdir/
        rm -f scipydoc.zip
        find -not -type d -exec chmod 644 {} \;
	
	INSTALLDIR=/usr/share/doc

	mkdir -p $pkgdir$INSTALLDIR
        mv $srcdir/scipydoc  $pkgdir$INSTALLDIR/scipydoc-zh
}


