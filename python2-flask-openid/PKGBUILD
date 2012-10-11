# Contributor: Fredric Johansson
pkgname=python2-flask-openid
pkgver=1.1
pkgrel=1
pkgdesc="A Flask extension for using openid authentication."
arch=(any)
url="http://pypi.python.org/pypi/Flask-OpenID"
license=("BSD")
depends=("python2" "python2-openid")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/F/Flask-OpenID/Flask-OpenID-$pkgver.tar.gz")
md5sums=('5bf43cb38adc48bc09f6ff8addfe2fcd')

build() {
    cd $srcdir/Flask-OpenID-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
