# Maintainer: Rafael Bodill <justrafi at gmail dot com>
# Contributor: Jack <nim901@gmail.com>
pkgname=pyfribidi
pkgver=0.10.0
pkgrel=2
pkgdesc="PyFribidi is a simple FriBidi binding to python."
arch=('any')
url="http://pyfribidi.sourceforge.net/"
license=('GPL')
depends=('fribidi' 'python2') # or python
source=("http://downloads.sourceforge.net/pyfribidi/$pkgname-$pkgver.tar.bz2")
md5sums=('787e6fe851e8be43fe97008beb150705')

package() {
	cd $srcdir/$pkgname-$pkgver

	# Quick Installation
	python2 setup.py install --root=$pkgdir
}

# vim: set ts=2 sw=2 tw=80 noet :
