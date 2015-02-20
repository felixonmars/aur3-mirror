# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Valentin V. Bartenev <ne@vbart.ru> http://vbart.info/
# Contributor: apkawa <apkawa@gmail.com>
# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
pkgname=django-debug-toolbar
pkgver=0.11.0
pkgrel=1
pkgdesc='A configurable set of panels that display various debug information about the current request/response.'
arch=('any')
url='https://github.com/django-debug-toolbar/django-debug-toolbar'
license=('BSD')
depends=('python' 'python-django')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/django-debug-toolbar/django-debug-toolbar/archive/${pkgver}.tar.gz")
sha256sums=('e763f508b6aafed7ff33e69d67b1fa9149514d7301abe462979105ec4ba9a1e9')

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --install-data=/usr/share/$pkgname --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
