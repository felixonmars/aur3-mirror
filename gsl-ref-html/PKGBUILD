#piggy1983
#2009-12-11

pkgname=gsl-ref-html
pkgver=1.14
pkgrel=1
pkgdesc=("This package provides html files with the reference manual for the GNU Scientific Library (GSL), a collection of routines for numerical analysis.")
arch=(any)
url=('http://www.gnu.org/software/gsl')
license=('unknown')
source=("http://ftp.de.debian.org/debian/pool/non-free/g/gsl-ref-html/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('ce453562f287a0d8d388d142ec3256dd')

build()
{
	cd $srcdir/
       # rm -f 
        find -not -type d -exec chmod 644 {} \;
	
	INSTALLDIR=/usr/share/doc

	mkdir -p $pkgdir$INSTALLDIR
        mv $srcdir/$pkgname-$pkgver  $pkgdir$INSTALLDIR/
}
