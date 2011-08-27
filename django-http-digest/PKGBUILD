# Contributor: Almad (bugs@almad.net)
pkgname=django-http-digest
pkgver=0.2.0
pkgrel=1
pkgdesc="Django HTTP digest"
arch=('i686 x86_64')
url="http://devel.almad.net/trac/django-http-digest"
license=('BSD')
depends=('python')
source=("http://devel.almad.net/download/djangohttpdigest/djangohttpdigest-$pkgver.tar.gz")
md5sums=('7825e037fd53c92a6e28c71ecc8a0b63')

build() { 
    cd $srcdir/djangohttpdigest-$pkgver
    python setup.py build || return 1
    python setup.py install --root=$pkgdir || return 1
}
