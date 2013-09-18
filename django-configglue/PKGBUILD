# Contributor: Alexandre Filgueira <faidoc@gmail.com>

pkgname=django-configglue
pkgver=0.7
pkgrel=1
pkgdesc="Django commands for managing configglue generated settings"
arch=(any)
url="https://pypi.python.org/pypi/django-configglue"
license=('LGPL')
depends=('python2-configglue')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/d/django-configglue/$pkgname-$pkgver.tar.gz")
md5sums=('526c66110da5fd5632cddb30a4b52dea')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
