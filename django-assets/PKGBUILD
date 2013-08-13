pkgname=django-assets
pipname=django-assets
pkgver=0.8
pkgrel=1
pkgdesc="Asset management for Django, to compress and merge CSS and Javascript files."
arch=(any)
url="http://github.com/miracle2k/django-assets"
license=('BSD')
depends=('python2' 'python2-django' 'python2-webassets')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/d/${pipname}/${pipname}-${pkgver}.tar.gz")
md5sums=('2c7f3876420f825aa39f9bbfe5f7f95d')

package() {
  cd "$srcdir/$pipname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

