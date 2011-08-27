# Packager: cs-cam - me.at.camdaniel.com
pkgname=pyxine
pkgver=0.1alpha2
pkgrel=1
pkgdesc="Python wrapper for libxine"
url="http://pyxine.sourceforge.net/"
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
depends=('python')
md5sums=('cfb875cc67017b4c75c904fd82dc3ef7')

build() {
	cd $startdir/src/$pkgname-$pkgver
	python setup.py install --prefix $startdir/pkg/usr
}
	
