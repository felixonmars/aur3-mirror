# Maintainer: Jens Staal <staal1978@gmail.com>
# Maintainer: perlawk

pkgname=curie-git
pkgver=20140120012
pkgrel=3
pkgdesc="minimalistic C library, non-posix, not standard-conformant"
arch=('i686' 'x86_64')
url="http://becquerel.org/curie"
license=('MIT')
provides=('curie')
makedepends=('git')
options=(staticlibs)
source=('Makefile.src' 'Makefile.testcase')
_gitroot=('git://git.becquerel.org/kyuba/curie.git')
_gitname=('curie')

prepare() {
	cd "$srcdir"
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull $_gitroot
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi	
		
	cd "$srcdir"/curie/src; cp "$srcdir"/Makefile.src Makefile
	cd "$srcdir"/curie/src/test-case; cp "$srcdir"/Makefile.testcase Makefile
}

build() {
	cd "$srcdir"/curie/src; 
	make
}

package() {
	cd "$srcdir"/curie/src; 
	mkdir -p "$pkgdir"/usr/lib/
	mkdir -p "$pkgdir"/usr/include/
	cp libcurie.so libcurie.a "$pkgdir"/usr/lib/
	cp -a ../include/sievert ../include/curie "$pkgdir"/usr/include/
}
md5sums=('6b2ecec91b2384202b76c918c849e7dd'
         '07d74a51e11fa0ce123340f05b36cc50')
