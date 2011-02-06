# Maintainer: Laszlo Papp <dj szapi at archlinux us>

pkgname=django-remember_me
pkgver=0.1.1
pkgrel=1
pkgdesc="Django application that provides a login form with a Remember Me checkbox"
arch=('i686' 'x86_64')
license=('GPL')
url="http://code.google.com/p/django-remember-me/"
depends=('django')
source=("http://django-remember-me.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('89e7cda17fb1cd6ec7d9e03a040e9a41')

build() {
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root=$startdir/pkg || return 1
}
