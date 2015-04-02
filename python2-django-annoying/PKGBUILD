# Maintainer: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>

_python=python2
_pkgname=django-annoying
pkgname=$_python-$_pkgname
pkgver=0.8.1
pkgrel=1
pkgdesc="A django application that tries to eliminate annoying things in the Django framework"
arch=('any')
url="https://github.com/skorokithakis/django-annoying"
license=('BSD')
makedepends=("$_python-setuptools")
depends=("$_python-django")
conflicts=('django-annoying-hg')
provides=("$pkgname=$pkgver")
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/d/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('7d3401eb279a51204db7fffc1b5b5fdc')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
