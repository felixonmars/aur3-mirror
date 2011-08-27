# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=django-profiles
pkgver=0.2
pkgrel=3
pkgdesc="A simple, generic user-profile application for Django"
arch=('any')
url="http://bitbucket.org/ubernostrum/django-profiles/wiki/Home"
license=('BSD')
depends=('django')
makedepends=('python2-distribute')
source=("http://bitbucket.org/ubernostrum/$pkgname/get/v$pkgver.bz2")
md5sums=('862f7315802ff4ec7ecf4f1d101fc966')

build() { 
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" -O1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
