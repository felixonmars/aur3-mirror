# Maintainer: elwin013 <kontakt AT elwin013 DOT com>

pkgname=django1.1
pkgver=1.1.4
pkgrel=1
pkgdesc="Last version of django framework from 1.x branch"
arch=(any)
license=('BSD')
url="http://www.djangoproject.com"
provides=('django')
conflicts=('django')
depends=('setuptools' 'python2')
source=(http://media.djangoproject.com/releases/1.1/Django-${pkgver}.tar.gz)
md5sums=('e818668acc4de944f85e494ac80f1e7d')

build() {
    cd $srcdir/Django-$pkgver
    python2.7 setup.py install --root=$pkgdir
    install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
