# Maintainer: djanku <djanku (at) email (dot) cz>
pkgname=python2-flask-testing
pkgver=0.4
pkgrel=1
pkgdesc="Unittest extensions for Flask."
arch=(any)
url="http://pypi.python.org/pypi/Flask-Testing"
license=("BSD")
depends=("python2" "python2-flask" "twill" "python2-simplejson")
makedepends=("setuptools" "python2-nose" "python2-blinker")
source=("http://pypi.python.org/packages/source/F/Flask-Testing/Flask-Testing-$pkgver.tar.gz")
md5sums=('e4007ecdb70e6a792079ec290751f282')

build() {
    cd $srcdir/Flask-Testing-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
