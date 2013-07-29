# Maintainer: Alexej Magura <agm2819*gmail*>
# 
# 
pkgname=hsz
pkgver=2.0.4
epoch=4
pkgrel=3
pkgdesc="transcodes between html entities and regular text"
arch=('i686', 'x86_64')
url="https://sourceforge.net/projects/htmlsymbolize/"
license=('GPL3')
depends=('python2')
optdepends=('wxpython: gui support')
source=("http://sourceforge.net/projects/htmlsymbolize/files/$pkgver/$pkgname-${pkgver}.tar.gz/download")
md5sums=('b3cf8d885e7dd914cf114b3acd53e697')
	 
build() {

    cd $srcdir/$pkgname-$pkgver

    if [[ $CARCH = "x86_64" ]]; then

	make m64=1 $(echo -n $CARCH)=1

    elif [[ $CARCH = "i686" ]]; then

	make m32=1 $(echo -n $CARCH)=1
    
    elif [[ $CARCH = "i586" ]]; then
	
	make m32=1 $(echo -n $CARCH)=1

    elif [[ $CARCH = "i486" ]]; then
	
	make m32=1 $(echo -n $CARCH)=1

    elif [[ $CARCH = "i386" ]]; then
	
	make m32=1 $(echo -n $CARCH)=1

    else

	make $(echo -n $CARCH)=1

    fi


}

package() {

    cd $srcdir/$pkgname-$pkgver

    make DESTDIR=$pkgdir install

    make clean

}
