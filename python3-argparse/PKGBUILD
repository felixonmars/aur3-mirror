# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Changaco <changaco ατ changaco δοτ net>

pkgname=python3-argparse
pkgver=1.1
pkgrel=2
pkgdesc="Command line parsing library for python3 (using 2to3)"
arch=('any')
url='http://code.google.com/p/argparse/'
license=('Apache')
depends=('python>=3.0' 'python<3.2')
source=("http://argparse.googlecode.com/files/argparse-$pkgver.zip")
md5sums=('e62565cde81a8deb61f90dcb5e8861a4')

build() {
	cd ${srcdir}/argparse-$pkgver
	2to3 -w argparse.py
	python setup.py build || return 1
	python setup.py install --root=${pkgdir} || return 1
}
