# Maintainer : Axilleas Pipinellis <axilleas@archlinux.info>

pkgname=python2-pysendfile
_pkgname=pysendfile
pkgver=2.0.0
pkgrel=1
pkgdesc="A Python interface to sendfile(2)"
url="http://code.google.com/p/pysendfile/"
license=('MIT')
arch=('any')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pysendfile.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
md5sums=('bd8d96b64e7c5c5b91ea2a6659aa82a3')

package() {
	cd $srcdir/$_pkgname-$pkgver
	python2 setup.py install --root=$pkgdir --optimize=1
	}

# vim:set ts=2 sw=2 et:
