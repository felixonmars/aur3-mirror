#制作者：t.cunly
#E-mail: piggy1983@163.com

pkgname=o2scl
pkgver=0.907
pkgrel=1
pkgdesc="Object-oriented Scientific Computing Lib"
url='http://o2scl.sourceforge.net'
arch=(i686 x86_64)
license=('GPLv3')
depends=('gsl')
install=o2scl.install
source=("http://ftp.heanet.ie/pub/sourceforge/o/project/o2/o2scl/o2scl/Version%200.907%20(beta)/o2scl-0.907.tar.gz")
md5sums=('f9d75ef52abab0a8ce25cbe8b9f3d5ff')

build()
{
	cd ${srcdir}/$pkgname-$pkgver

        ./configure --libdir=/usr/local/lib/o2scl 

	make || return 1
	make DESTDIR=${pkgdir} install || return 1
        
        DOCDIR=/usr/share/doc
        install -d $pkgdir$DOCDIR
        mv $pkgdir/usr/local/doc/$pkgname $pkgdir$DOCDIR/
        rm -rf $pkgdir/usr/local/doc
}

