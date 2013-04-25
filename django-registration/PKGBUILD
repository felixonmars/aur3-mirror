# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>
# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=django-registration
pkgver=0.8
pkgrel=4
pkgdesc="A simple, generic user-registration application for Django"
arch=( any )
url="http://bitbucket.org/ubernostrum/django-registration"
license=('GPL')
depends=( python2 python2-django )
source=("http://pypi.python.org/packages/source/d/django-registration/$pkgname-$pkgver.tar.gz")
md5sums=('d3e785858e0040a6c3201acd43409b2e')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py build
    python2 setup.py install --root="$pkgdir" --optimize=1
}
