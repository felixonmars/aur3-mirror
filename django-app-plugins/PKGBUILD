# Contributor: Mike Roberts <noodlesgc@gmail.com>
pkgname=django-app-plugins
pkgver=0.1.1
pkgrel=1
pkgdesc="Allow 3rd party apps to dynamically insert template inclusions into your apps at pre-defined plugin points. Similar to how Eclipse manages plugins via contributors."
arch=('i686' 'x86_64')
url="http://code.google.com/p/django-app-plugins/"
depends=('django')
license=('UNKNOWN')
source=(http://django-app-plugins.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('f6fea410258d43c2376a85dfbab03802')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

