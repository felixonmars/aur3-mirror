# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Artyom Olshevskiy <siasiamail@gmail.com>
pkgname=python2-jsmin  
pkgver=2.0.2
pkgrel=1 
pkgdesc="JavaScript minifier"
url="http://pypi.python.org/pypi/jsmin"
arch=('any')
license=('unknown')
depends=('python2')
makedepends=('python2-distribute')
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/j/jsmin/jsmin-$pkgver.tar.gz)
md5sums=('cd87c582cf897692df63c506e309249b')
build() {
	cd $srcdir/jsmin-$pkgver
	python2 setup.py install --root=${pkgdir} --optimize=1
}
