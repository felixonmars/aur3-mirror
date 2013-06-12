# Maintainer: perlawk
pkgname=python2-shedskin
pkgver=0.9.3
pkgrel=1
pkgdesc="Shed Skin is an experimental compiler, that can translate pure, but implicitly statically typed Python (2.4-2.6) programs into optimized C++." 
arch=(any)
url="http://code.google.com/p/shedskin/"
license=('New BSD')
conflicts=()
provides=()
depends=('python2>2.4')
source="http://shedskin.googlecode.com/files/shedskin-0.9.3.tgz"
md5sums=('f41c08f10cb1f4d96813c21bd9f0ccf7')

build() {
  cd "$srcdir/shedskin-$pkgver"
  python2 setup.py build

}

package() {
  cd "$srcdir/shedskin-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
