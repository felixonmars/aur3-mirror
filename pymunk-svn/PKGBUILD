# Contributor: Joseph Xu <josephzxu@gmail.com>
pkgname=pymunk-svn
pkgver=261
pkgrel=1
pkgdesc="pymunk is a wrapper around the 2d physics library Chipmunk"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pymunk/"
license=('MIT')
depends=('python>=2.4')
makedepends=('gcc')

build() {
	svn co http://pymunk.googlecode.com/svn/trunk/ pymunk
	cd pymunk
	python setup.py install --root=$pkgdir
	mkdir -p $pkgdir/usr/share/licenses/pymunk
	cp LICENSE.txt $pkgdir/usr/share/licenses/pymunk/LICENSE
	
	# remove some unnecessary binaries
	cd $pkgdir/usr/lib/python*/site-packages/pymunk/
	rm *.dylib *.dll
	echo $CARCH
	if [ "$CARCH" = "i686" ]; then
		rm libchipmunk64.so
	else
		rm libchipmunk.so
	fi
}
