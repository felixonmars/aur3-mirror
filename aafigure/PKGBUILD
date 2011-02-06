# Contributor: François Boulogne <fboulogne at april dot org>
pkgname=aafigure
pkgver=0.5
pkgrel=1
pkgdesc="ASCII art to image converter"
arch=('i686' 'x86_64')
url="http://launchpad.net/aafigure"
license=('custom-BSD')
depends=('python2' 'setuptools')
source=(http://pypi.python.org/packages/source/a/aafigure/aafigure-$pkgver.tar.gz LICENSE.txt aafigure.1)

build() {
  cd $startdir/src
  
  install -D LICENSE.txt $startdir/pkg/usr/share/licenses/aafigure/COPYING
  install -D aafigure.1 $startdir/pkg/usr/share/man/man1/aafigure.1
  cd $startdir/src/aafigure-$pkgver
  for file in $(find . -name '*.py' -print); do 
	echo $file
 	sed -i 's#/usr/bin/env python#/usr/bin/env python2#' $file 
  done  
  python2 setup.py bdist_dumb || return 1
  cd $startdir/pkg
  tar xzvf $startdir/src/aafigure-$pkgver/dist/aafigure-$pkgver.linux*.tar.gz	
  

}
md5sums=('5322888a21eb0bb2e749fbf98eddf574'
         '2539d72a3354d9187f2c10acebf2e6dd'
         '82c749c825d421de0abe21c4f50c671c')
