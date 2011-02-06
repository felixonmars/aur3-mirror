# Contributor: Dakeyras Khan <dakeyras.khan@gmail.com>

pkgname=libface
pkgver=0.1
pkgrel=1
pkgdesc="Face recognition library"
url="http://openbio.sourceforge.net/"
license=("GPL")
arch=(i686 x86_64)
source=('http://freefr.dl.sourceforge.net/sourceforge/libface/libface-0.1.tar.gz'
		'patch_opencv.diff')
md5sums=('ba23b2edb0d499c3674cef2fcedefb60'
		'50de14770d177dc9292d23d796053e4c')
depends=('opencv')

build() {
    
	cd "${srcdir}/$pkgname-$pkgver"

    ./configure
	
	# patching
	cd "include/"
	patch < "${startdir}/patch_opencv.diff"
	
	cd "${srcdir}/$pkgname-$pkgver"
    make || return 1
    make DESTDIR=$pkgdir install
    
}
