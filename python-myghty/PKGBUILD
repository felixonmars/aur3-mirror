# Maintainer: Adam 'battlemidget' Stokes <adam.stokes@gmail.com>
pkgname=python-myghty
pkgver=1.1
pkgrel=2
pkgdesc="A high performance Python templating framework"
depends=('python' 'setuptools' 'python-routes>=1.0'
         'python-paste' 'python-pastedeploy' 'python-pastescript')
source=("http://cheeseshop.python.org/packages/source/M/Myghty/Myghty-$pkgver.tar.gz")
url="http://www.myghty.org/"
license='MIT'
arch=('i686' 'x86_64')
md5sums=('5865361811dca4054f1ec60ac32ee965')
sha1sums=('2e6714780d2250d936731a74b331d924bb1799bc')

build() {
	cd $startdir/src/Myghty-${pkgver}
	python setup.py install --root=$startdir/pkg

	install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}

