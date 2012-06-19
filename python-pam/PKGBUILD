# Maintainer : kozec <kozec at kozec dot com>
pkgname=python-pam
pkgver=0.1.4
pkgrel=1
pkgdesc="Module that provides an authenticate function that allows the caller to authenticate a given username / password against the PAM system on Linux."
url="http://atlee.ca/software/pam/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python2' 'pam')
conflicts=()
replaces=()
backup=()
source=("http://pypi.python.org/packages/source/p/pam/pam-0.1.4.tar.gz#md5=4c5247af579352bb6882dac64be10a33")
md5sums=('4c5247af579352bb6882dac64be10a33')

build() {
	cd $srcdir/pam-$pkgver
	python2 setup.py build
	python2 setup.py install --root=$pkgdir
	}
