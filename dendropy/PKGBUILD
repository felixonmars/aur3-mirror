# Contributor: Stunts <f.pinamartins@gmail.com>
 
pkgname=dendropy
upname=DendroPy
pkgver=3.12.0
pkgrel=1
pkgdesc="A progam to create dendrograms form multiple tree files (usefull for mrbayes)"
arch=('any')
url="http://packages.python.org/DendroPy/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/D/$upname/$upname-$pkgver.tar.gz
	LICENSE)
md5sums=('6971ac9a8508b4198fd357fab0affc84'
         'a5f086c0c8484b08db856286dc0985b6')


package() {
	cd $srcdir/$upname-$pkgver
	python2 setup.py install --prefix=/usr --root="$pkgdir"
	install -D -m644 ../LICENSE $pkgdir/usr/share/licenses/dendropy/LICENSE
}
