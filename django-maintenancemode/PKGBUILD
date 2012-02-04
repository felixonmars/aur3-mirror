# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=django-maintenancemode
pkgver=0.9.2
pkgrel=3
pkgdesc="Allow you to temporary shutdown your site for maintenance work"
arch=('any')
url="http://code.google.com/p/django-maintenancemode/"
license=('BSD')
depends=('django')
makedepends=('python2-distribute')
source=("http://django-maintenancemode.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('6ad8ce7ed6c7983a1f874b2dde2742bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
