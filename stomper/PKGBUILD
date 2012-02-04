# Contributor: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>

pkgname=stomper
pkgver=0.2.4
pkgrel=1
pkgdesc="A transport neutral client implementation of the STOMP protocol."
arch=('any')
url="http://code.google.com/p/stomper/"
license=('apache')
depends=('python2')
makedepends=('python2-distribute')
source=("http://stomper.googlecode.com/files/$pkgname-$pkgver.tar.gz")

build() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install --root=$startdir/pkg --prefix=/usr
}
md5sums=('474d12bcd36a27e3b5278e19d908914d')
sha1sums=('0ac4bf6984541003a8a80cfde6b89f207ce99c45')
