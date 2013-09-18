# Contributor: Alexandre Filgueira <faidoc@gmail.com>

pkgname=django-pgtools
pkgver=0.1
pkgrel=1
pkgdesc="Framework for creating set of checks (methods) which determine the health of the system"
arch=(any)
url="https://launchpad.net/django-pgtools"
license=('LGPL')
depends=('python2-psycopg2' 'python2-mock')
makedepends=('python2-distribute')
source=("https://launchpad.net/django-pgtools/trunk/0.1/+download/$pkgname-$pkgver.tar.gz")
md5sums=('dff6bd82b5a150b6acf9808cabc14813')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
