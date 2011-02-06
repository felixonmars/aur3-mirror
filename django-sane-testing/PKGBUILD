# Contributor: Almad (bugs at almad.net)
pkgname=django-sane-testing
pkgver=0.5.6
pkgrel=2
pkgdesc="Set of nose testing to improve django testing capabilities"
arch=('i686 x86_64')
url="http://devel.almad.net/trac/django-sane-testing"
license=('BSD')
makedepends=('setuptools')
depends=('python' 'python-nose' 'setuptools')
optdepends=('cherrypy: Use CherryPy WSGI instead of Django one')
source=("http://devel.almad.net/download/djangosanetesting/djangosanetesting-$pkgver.tar.gz")
md5sums=('775a58ddb910cc8d9abbf143620ea414')

build() { 
    cd $srcdir/djangosanetesting-$pkgver
    python setup.py build || return 1
    python setup.py install --root=$pkgdir || return 1
}
