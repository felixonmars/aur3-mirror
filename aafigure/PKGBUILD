# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: François Boulogne <fboulogne at april dot org>

pkgname=aafigure
pkgver=0.5
pkgrel=2
pkgdesc="ASCII art to image converter"
arch=('i686' 'x86_64')
url="http://launchpad.net/aafigure"
license=('custom-BSD')
depends=('python2' 'python2-distribute')
source=(http://pypi.python.org/packages/source/a/aafigure/aafigure-$pkgver.tar.gz
	'LICENSE.txt'
	'aafigure.1')
md5sums=('5322888a21eb0bb2e749fbf98eddf574'
         '2539d72a3354d9187f2c10acebf2e6dd'
         '82c749c825d421de0abe21c4f50c671c')


build() {
	cd $srcdir/aafigure-$pkgver
	for file in $(find . -name '*.py' -print); do 
		echo $file
		sed -i 's#/usr/bin/env python#/usr/bin/env python2#' $file 
	done

	python2 setup.py bdist_dumb
}

package() {
	cd $srcdir

	install -D LICENSE.txt $pkgdir/usr/share/licenses/aafigure/COPYING
	install -D aafigure.1 $pkgdir/usr/share/man/man1/aafigure.1

	cd $pkgdir
	tar xzvf $srcdir/aafigure-$pkgver/dist/aafigure-$pkgver.linux*.tar.gz
}