# Contributor: mlq <mlq@pwmt.org>
pkgname=python-flask-themes
pkgver=0.1.2
pkgrel=1
pkgdesc="Flask-Themes makes it easy for your application to support a wide range
of appearances."
arch=(any)
url="http://pypi.python.org/pypi/Flask-Themes"
license=("BSD")
depends=("python2" "python-flask")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/F/Flask-Themes/Flask-Themes-$pkgver.tar.gz")
md5sums=('4ec60aaab006b82cef9b04d0a83940b8')

build() {
    cd $srcdir/Flask-Themes-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
