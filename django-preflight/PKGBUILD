# Maintainer: Alexandre Filgueira <faidoc@gmail.com>

pkgname=django-preflight
pkgver=0.1.4
pkgrel=1
pkgdesc="Framework for creating set of checks (methods) which determine the health of the system"
arch=(any)
url="https://pypi.python.org/pypi/django-preflight/"
license=('BSD')
depends=('python2-django')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/d/django-preflight/$pkgname-$pkgver.tar.gz")
md5sums=('6cfa936460859979f8ade37055043d92')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
