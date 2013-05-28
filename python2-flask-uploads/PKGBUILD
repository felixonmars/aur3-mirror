# Maintainer: mlq <mlq@pwmt.org>

pkgname=python2-flask-uploads
pkgver=0.1.3
pkgrel=1
pkgdesc="Flexible and efficient upload handling for Flask"
arch=(any)
url="http://pypi.python.org/pypi/Flask-Uploads"
license=("BSD")
depends=("python2" "python2-flask")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/F/Flask-Uploads/Flask-Uploads-${pkgver}.tar.gz")
md5sums=("f17e38aeac525a77c04a366b7dc09c93")

build() {
    cd "$srcdir/Flask-Uploads-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
