#piggy1983@163.com

pkgname=qtiplot-doc
pkgver=0.9.8.4
pkgrel=1
pkgdesc="QtiPlot documentations (html)"
url="http://soft.proindependent.com/qtiplot.html"
license=('GDL')
arch=('any')
source=('http://download.berlios.de/qtiplot/qtiplot-manual-en.tar.bz2')
md5sums=('8686676db9bfff9b8f1cace8a71918c1')

build()
{
   /bin/true
}


package()
{
   INSTALLDIR=${pkgdir}/usr/share/doc/qtiplot/manual

   install -d -m755 $INSTALLDIR/common/
   install -d -m755 $INSTALLDIR/equations/
   install -d -m755 $INSTALLDIR/icons/
   install -d -m755 $INSTALLDIR/pics/
   install -d -m755 $INSTALLDIR/tutorial/
   
   install -m644 $srcdir/qtiplot-manual-en/*.html $INSTALLDIR/
   install -m644 $srcdir/qtiplot-manual-en/qtiplot* $INSTALLDIR/
   install -m644 $srcdir/qtiplot-manual-en/common/* $INSTALLDIR/common/
   install -m644 $srcdir/qtiplot-manual-en/equations/* $INSTALLDIR/equations/
   install -m644 $srcdir/qtiplot-manual-en/icons/* $INSTALLDIR/icons/
   install -m644 $srcdir/qtiplot-manual-en/pics/* $INSTALLDIR/pics/
   install -m644 $srcdir/qtiplot-manual-en/tutorial/* $INSTALLDIR/tutorial/
}

