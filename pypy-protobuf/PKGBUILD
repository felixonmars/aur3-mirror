# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=pypy-protobuf
_pkgname=protobuf
pkgver=2.5.0
pkgrel=1
pkgdesc="A way of encoding structured data in an efficient yet extensible format (python API for pypy)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/protobuf/"
license=('APACHE')
depends=('gcc-libs' 'zlib')
makedepends=('pypy' 'setuptools')
options=(!libtool)
source=(http://$_pkgname.googlecode.com/files/$_pkgname-$pkgver.tar.bz2)
md5sums=('a72001a9067a4c2c4e0e836d0f92ece4')

build() {
	cd $srcdir/$_pkgname-$pkgver
	./autogen.sh
	./configure --prefix=/usr --disable-static
}

package() {
	cd $srcdir/protobuf-$pkgver/python
	pypy setup.py install --prefix=/opt/pypy/ --root $pkgdir
}
