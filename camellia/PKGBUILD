# Contributor: perlawk
pkgname=camellia
pkgver=2.7.0
pkgrel=1
pkgdesc="An open source Image Processing & Computer Vision library."
arch=('i686' 'x86_64')
url="http://camellia.sourceforge.net/"
license=('BSD')

source=('http://downloads.sourceforge.net/camellia/CamelliaLib-2.7.0.tar.gz'
	'cpp_demo_stdio.diff')

prepare() {
	cd $startdir/src/CamelliaLib-2.7.0
	patch -p0 < ../cpp_demo_stdio.diff || return 1
}

build() {
	cd $startdir/src/CamelliaLib-2.7.0
	./configure --prefix=/usr || return 1
	make || return 1
}

package() {
	cd $startdir/src/CamelliaLib-2.7.0
	make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('9dcfccb1d88193a963d18403f0e8474f'
         '6b5dadb643cf8dbeb4669878a2aca12a')
