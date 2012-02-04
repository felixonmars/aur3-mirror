# 23.04.2006 - Erol V. Aktay <e.aktay@gmail.com>
pkgname=m2300w
pkgver=0.51
pkgrel=3
pkgdesc="CUPS driver for the Minolta/QMS magicolor2300w"
url="http://m2300w.sourceforge.net"
license="GPL"
depends=('cups' 'foomatic-filters' 'ghostscript')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=(ba340a6ea545052aa2d1b634e9de1919)
arch=("x86_64" "i686")

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure
    make 
}
package() {    
    cd $srcdir/$pkgname-$pkgver	 
    make INSTROOT=$pkgdir install
    rm -r $pkgdir/usr/share/foomatic/db/source/{driver,opt/m2300w-{ColorMode,ColorProfile,MediaType,PageSize,Resolution,psnup}.xml,printer}
	}
