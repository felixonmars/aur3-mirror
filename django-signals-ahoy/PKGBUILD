# Maintainer: Mike Roberts <noodlesgc@gmail.com>
pkgname=django-signals-ahoy
pkgver=0.1
pkgrel=2
pkgdesc="Provides an extended set of signals for use by Django apps."
url="http://bitbucket.org/bkroeze/django-signals-ahoy"
arch=('i686' 'x86_64')
license=('BSD')
depends=('django')
source=(http://bitbucket.org/bkroeze/django-signals-ahoy/downloads/$pkgname-$pkgver-0.tar.gz)
md5sums=('9763126c989bdd995fcb0604fde426b0')

build() {
    cd "$srcdir/$pkgname-$pkgver-0"

    python2 setup.py build
    python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
    rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests
}
