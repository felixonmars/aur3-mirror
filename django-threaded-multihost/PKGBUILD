# Maintainer: Mike Roberts <noodlesgc@gmail.com>
pkgname=django-threaded-multihost
pkgver=1.3
pkgrel=1
pkgdesc="Provides an extended set of signals for use by Django apps."
url="http://bitbucket.org/bkroeze/django-threaded-multihost/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('django')
source=(http://bitbucket.org/bkroeze/django-threaded-multihost/downloads/$pkgname-$pkgver-2.tar.gz)
md5sums=('bba26d70c76028c9334c35dc439fed60')

build() {
	cd "$srcdir/$pkgname-$pkgver-2"

    python setup.py build
	python setup.py install --prefix=/usr --root="$pkgdir" || return 1s
}
