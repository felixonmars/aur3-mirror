#piggy1983
#2009-11-1

pkgname=paraview3-doc
pkgver=nightly
pkgrel=1
pkgdesc=("ParaView is an open-source, multi-platform application designed to visualize data sets of size varying from small to very large.")
arch=(any)
url=('http://www.paraview.org')
license=('ParaView License Version 1.2')
source=('http://www.paraview.org/ParaView3/Doc/Nightly/ParaView3-html.tar.gz')
md5sums=('d865e099f1c8f0c82d5aeb435c4dcc54')

build()
{
	cd $srcdir/
	
	INSTALLDIR=/usr/share/doc
	mkdir -p $pkgdir$INSTALLDIR
	mv    html     $pkgdir$INSTALLDIR/paraview
}

 
