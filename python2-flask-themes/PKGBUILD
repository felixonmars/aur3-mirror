# Contributor: mlq <mlq@pwmt.org>
pkgname=python2-flask-themes
pkgver=0.1.3
pkgrel=1
pkgdesc="Flask-Themes makes it easy for your application to support a wide range
of appearances."
arch=(any)
url="http://pypi.python.org/pypi/Flask-Themes"
license=("BSD")
depends=("python2" "python2-flask")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/F/Flask-Themes/Flask-Themes-$pkgver.tar.gz")
md5sums=('2ed4ce4c6f3c94941f77838793938e1b')

build() {
    cd $srcdir/Flask-Themes-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
